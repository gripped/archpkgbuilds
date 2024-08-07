# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}
pkgver=4.6.0
pkgrel=3
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
makedepends=(
  'freeglut'
  'git'
  'glu'
  'mesa'
)
provides=('libtiff.so' 'libtiffxx.so')
source=("git+https://gitlab.com/libtiff/libtiff.git?signed#tag=v${pkgver}")
sha512sums=('f72a845856320aea20b5061a060c8fd67006a4dd370bf71eb6288fbf6d9255caa74c2d3061aad4867063a35f131d22cc2bc490ab1ca47eca22573d0cd194bb31')
b2sums=('e3c31b9afefecdcafb52d174840c2eee8cb4dd43ff1a81eef52a09e0753cfb247775baa7a42b865e518f2cdaa04828e4acbb43a0ead373b1251b2d0c03f8d0a6')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd libtiff
  # CVE-2023-6277
  git cherry-pick -n 5320c9d89c054fa805d037d84c57da874470b01a
  # CVE-2023-52356
  git cherry-pick -n 51558511bdbbcffdce534db21dbaf5d54b31638a
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
