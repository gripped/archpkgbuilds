# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.8.0
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('lib32-glibc' 'xz')
makedepends=('git' 'po4a' 'doxygen')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://github.com/tukaani-project/xz#tag=v${pkgver}?signed")
sha256sums=('57caa7cf1678e8442e5979831a3caaedbbee707ff67f462280c918277fd6eca0')
sha512sums=('40e5639dc024d9c40ac71c649a6b0408e15b02535763b1cdaa3e326fc14e5728918c5570454135f4ee7145a18da0a0a93d23f650b9653d939b2652ca0eed9961')

prepare() {
  cd xz

  ./autogen.sh
}

build() {
  cd xz

  export CC='gcc -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-rpath \
    --enable-werror
  make
}

check() {
  cd xz

  make check
}

package() {
  cd xz

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -d -m0755 "${pkgdir}"/usr/share/licenses
  ln -s xz "${pkgdir}"/usr/share/licenses/lib32-xz
}
