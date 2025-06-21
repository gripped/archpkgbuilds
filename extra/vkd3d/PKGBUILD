# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=vkd3d
pkgver=1.16
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('spirv-tools' 'vulkan-icd-loader' 'perl-json')
makedepends=('spirv-headers' 'vulkan-headers' 'xcb-util-keysyms' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('eb14deadc7d3577f4affdca837d412735b530d8ce282340e2741ffc4d542dfae8b1337b6ce0fada74ec3d0d4184b0ce8ecce0aa5d4bdf67c8d98c1b4f04a50f4')

prepare() {
  cd vkd3d-$pkgver
  ./configure --prefix=/usr --with-spirv-tools
}

build() {
  cd vkd3d-$pkgver
  make
}

package() {
  cd vkd3d-$pkgver
  make DESTDIR="$pkgdir" install
}
