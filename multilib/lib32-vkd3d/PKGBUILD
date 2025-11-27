# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=1.18
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('lib32-vulkan-icd-loader' 'perl-json')
makedepends=('spirv-headers' 'vulkan-headers'  'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('33668fbcb04828c7630734563b6b8d38b5cce78f3971391728a2043021a3b5ca7940c410fd2586cb7affa94dc3bf7eae32d2957cfef39fd97c92871b46aca3a4')

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
