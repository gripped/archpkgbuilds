# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=xz
pkgver=5.8.0
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('sh')
makedepends=('git' 'po4a' 'doxygen')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://github.com/tukaani-project/xz#tag=v${pkgver}?signed")
sha256sums=('57caa7cf1678e8442e5979831a3caaedbbee707ff67f462280c918277fd6eca0')
sha512sums=('40e5639dc024d9c40ac71c649a6b0408e15b02535763b1cdaa3e326fc14e5728918c5570454135f4ee7145a18da0a0a93d23f650b9653d939b2652ca0eed9961')

prepare() {
  cd ${pkgname}

  ./autogen.sh
}

build() {
  cd ${pkgname}

  ./configure \
    --prefix=/usr \
    --disable-rpath \
    --enable-doxygen \
    --enable-werror
  make
}

check() {
  cd ${pkgname}

  make check
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install

  install -d -m0755 "${pkgdir}/usr/share/licenses/xz/"
  ln -sf /usr/share/doc/xz/COPYING "${pkgdir}/usr/share/licenses/xz/"
}
