# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=vkd3d
pkgver=1.14
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('spirv-tools' 'vulkan-icd-loader')
makedepends=('spirv-headers' 'vulkan-headers' 'xcb-util-keysyms' 'xorgproto')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-$pkgver.tar.xz")
sha512sums=('db4429b591aa4a129361e9225241b6e5ec703f6877cafba235cbbf5d5dfc31eb37a80470f8d1295c46f68b99db715c8a54dced0d287fcea1c9174aa19ac4577d')

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
