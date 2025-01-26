# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.6.4
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
sha256sums=('0473bff1378094f9868d6f42effab0962d5c9e26616a6b88af3f72abcd8fce04')
sha512sums=('e3216eca5fae2c9ce419e698bfbe186903088dad0a579749cb49bcde8f9d4073b98bf1570fe69190a9a41feb2a7c9814498ec9b867527de1c74ff75a1cbdfc17')

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
