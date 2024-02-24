# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgbasename=libpng
pkgname=lib32-$_pkgbasename
pkgver=1.6.43
_libversion=16
pkgrel=1
pkgdesc='A collection of routines used to create PNG format graphics files (32-bit)'
arch=('x86_64')
url='http://www.libpng.org/pub/png/libpng.html'
license=('custom')
depends=('lib32-zlib' $_pkgbasename)
provides=('libpng16.so')
source=("https://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.xz")
sha256sums=('6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --program-suffix=-32 \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  rm "$pkgdir/usr/bin/libpng-config"
  ln -s "libpng${_libversion}-config-32" "$pkgdir/usr/bin/libpng-config-32"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
