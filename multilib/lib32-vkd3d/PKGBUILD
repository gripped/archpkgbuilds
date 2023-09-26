# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=1.9
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('lib32-vulkan-icd-loader')
makedepends=('spirv-headers' 'vulkan-headers'  'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('7fe931fca4bc2e13bd59f2068d758581797aa15530fb811d71323e3cd83a0f12ec3a00e2951f38033fccf8eabfca45e06dad79d80ccc164e047e13cbfc960d0e')

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
