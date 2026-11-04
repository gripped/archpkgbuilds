# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=2.0
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL-2.1-or-later')
depends=('lib32-vulkan-icd-loader')
makedepends=('git' 'perl-json' 'spirv-headers' 'vulkan-headers' 'wine' 'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("git+https://gitlab.winehq.org/wine/vkd3d.git#tag=vkd3d-$pkgver")
sha512sums=('4b03ada92cafc95a598c66354ca78c379626cb1f6d6d169dee57bb7dbf3b01c5e80fe1305316381b7a6debaf877f711b30709aed761319da66704fd6c63cbf80')

prepare() {
  cd $_pkgname
  ./autogen.sh
  export CC='gcc -m32'
  export CXX='g++ -m32'

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS="$LDFLAGS -L/usr/lib32"

  ./configure --libdir=/usr/lib32 --prefix=/usr
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include}
}
