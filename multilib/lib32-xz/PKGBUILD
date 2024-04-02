# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.6.1
pkgrel=3
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://xz.tukaani.org/xz-utils/'
license=('GPL' 'LGPL' 'custom')
depends=('lib32-glibc' 'xz')
makedepends=('git' 'po4a' 'doxygen')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://git.tukaani.org/xz.git#tag=v${pkgver}")
sha256sums=('e10fa4254d5ff033c78dcbfd2866e79a762b8a719503a7c146758e590de945dc')
sha512sums=('8f4ee2e5c9b46d0917d8bdf8b172a70d02a6cf2d4d78a2e99ae942e32979b72b407809ffda2885af41e2c9d801c19eab5e4fd73888fbaf042346be957df406fc')

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
