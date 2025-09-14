# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=vkd3d
pkgver=1.17
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('spirv-tools' 'vulkan-icd-loader' 'perl-json')
makedepends=('spirv-headers' 'vulkan-headers' 'xcb-util-keysyms' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('580b8bf0985a92ee40e25b777ad5439ef98bb6da952f51bc76de060e9117b50062807bc65f9252039eb6e18dd6162a7c92c5e2e29afc0dbf2494052fcc9364ea')

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
