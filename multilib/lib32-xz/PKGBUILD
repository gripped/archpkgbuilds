# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.6.2
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://xz.tukaani.org/xz-utils/'
license=('GPL' 'LGPL' 'custom')
depends=('lib32-glibc' 'xz')
makedepends=('git' 'po4a' 'doxygen')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://git.tukaani.org/xz.git#tag=v${pkgver}")
sha256sums=('a71fcf56faa1f7d9e9708ca8d6a97906b929307d6a98d220018852eef37853c8')
sha512sums=('f369f126dd3d538ef27ecce62e8ae01a2c9056eeb22c6b21d9a1d5e456f35330bc7f2bb0df525ad4a4f95ba84c0196c7c79ad768359786d3a73f876aa043f164')

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
