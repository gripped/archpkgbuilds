# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=1.17
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('lib32-vulkan-icd-loader' 'perl-json')
makedepends=('spirv-headers' 'vulkan-headers'  'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('580b8bf0985a92ee40e25b777ad5439ef98bb6da952f51bc76de060e9117b50062807bc65f9252039eb6e18dd6162a7c92c5e2e29afc0dbf2494052fcc9364ea')

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
