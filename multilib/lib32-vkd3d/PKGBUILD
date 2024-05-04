# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=1.11
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('lib32-vulkan-icd-loader')
makedepends=('spirv-headers' 'vulkan-headers'  'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('2b14f7f8d4d58c2bfc6c30aa0d24b6789c0887b2869cfb6be98d03b7b001a74a1fbe24439229fa4d3a618a69fe8eeb77d7a520a16276ae494fe6ee2357dd31d0')

prepare() {
  cd vkd3d-$pkgver
  export CC='gcc -m32'
  export CXX='g++ -m32'

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS="$LDFLAGS -L/usr/lib32"

  ./configure --libdir=/usr/lib32 --prefix=/usr
}

build() {
  cd vkd3d-$pkgver
  make
}

package() {
  cd vkd3d-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include}
}
