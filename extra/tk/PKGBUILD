# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=tk
pkgver=8.6.14
pkgrel=1
pkgdesc="A windowing toolkit for use with tcl"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('tcl' 'libxss' 'libxft')
options=('staticlibs')
source=(https://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz)
sha256sums=('8ffdb720f47a6ca6107eac2dd877e30b0ef7fac14f3a84ebbd0b3612cee41a94')

build() {
  cd tk$pkgver/unix
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-threads --disable-rpath --enable-64bit
  make
}

check() {
  cd tk$pkgver/unix
#  make test
}

package() {
  cd tk$pkgver/unix
  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  ln -sf wish${pkgver%.*} "${pkgdir}/usr/bin/wish"
  ln -sf libtk${pkgver%.*}.so "${pkgdir}/usr/lib/libtk.so"
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install private headers (FS#14388, FS#47616)
  cd ..
  for dir in compat generic generic/ttk unix; do
    install -dm755 "${pkgdir}"/usr/include/tk-private/$dir
    install -m644 -t "${pkgdir}"/usr/include/tk-private/$dir $dir/*.h
  done

  # remove buildroot traces
  sed -e "s#${srcdir}/tk${pkgver}/unix#/usr/lib#" \
      -e "s#${srcdir}/tk${pkgver}#/usr/include#" \
      -i "${pkgdir}/usr/lib/tkConfig.sh"

  # remove unrequired execute permissions (FS#75042)
  chmod -x "${pkgdir}/usr/lib/libtkstub8.6.a"
}
