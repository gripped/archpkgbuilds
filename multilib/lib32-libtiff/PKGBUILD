# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}
pkgver=4.7.1
pkgrel=1
pkgdesc='Library for manipulation of TIFF images (32-bit)'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('libtiff')
depends=(
  libtiff=$pkgver
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-libjpeg-turbo'
  'lib32-xz'
  'lib32-zlib'
  'lib32-zstd'
)
makedepends=(
  'freeglut'
  'git'
  'glu'
  'mesa'
)
provides=('libtiff.so' 'libtiffxx.so')
source=("git+https://gitlab.com/libtiff/libtiff.git?signed#tag=v${pkgver}")
sha512sums=('45a6c743e7c632b9dfe53f13c34d443b2e6ecaac3f4a314d2811d288794d10dddc31cc5ab7000bd5094bcbd1e8a81783fb9d971d60789c0e92ce727bbb9d8d61')
b2sums=('28fb783db36e184b578f19d1141c82df46fd60da323b592c73e6da97f3e2dddb5cb38bd2977eb4b93e361a65ee116cd249e980cebfd558d4d57182d1c8f8b3a9')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd libtiff
  autoreconf -fiv
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

  cd libtiff
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libtiff
  make check
}

package() {
  depends+=('libjpeg.so')
  cd libtiff
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
