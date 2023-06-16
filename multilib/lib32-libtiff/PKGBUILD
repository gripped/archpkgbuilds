# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}
pkgver=4.5.1
pkgrel=1
pkgdesc='Library for manipulation of TIFF images (32-bit)'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=(
  libtiff=$pkgver
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-libjpeg-turbo'
  'lib32-xz'
  'lib32-zlib'
  'lib32-zstd'
)
provides=('libtiff.so' 'libtiffxx.so')
source=(
  "https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"{,.sig}
)
sha512sums=('64ad2ae84f3cc67b9774d10cdeed41ab66cde9b50276dd4134318c963d26bea60de8c0b0297e77f47963bae163e0d28ed482fa8e809b1e0fb7b7c8a7f5a1cb9a'
            'SKIP')
b2sums=('ee496a5deeb49b6c4f866dbac0736c4bb84c29f45ae07cea52297679269a835761a3e54eeca5d75903e3d65f8117d4bbd16abdf1487813a31f9c9eb8d03e04c4'
        'SKIP')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd tiff-${pkgver}
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --enable-ld-version-script
    --mandir=/usr/share/man
    --with-docdir=/usr/share/doc/${pkgname}
    --libdir=/usr/lib32
    --includedir=/usr/include/libtiff32
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd tiff-${pkgver}
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd tiff-${pkgver}
  make check
}

package() {
  depends+=('libjpeg.so')
  cd tiff-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
