# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw
pkgdesc="A free, open source, portable framework for graphical application development"
pkgver=3.5.0
pkgrel=1
arch=('x86_64')
replaces=('glfw-x11' 'glfw-wayland' 'glfw-doc')
provides=('glfw-x11' 'glfw-wayland')
url="https://www.glfw.org/"
license=('custom:ZLIB')
depends=('libgl' 'libxkbcommon')
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader' 'extra-cmake-modules'
             'wayland-protocols' 'libxi' 'libxrandr' 'libxcursor' 'libxinerama')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glfw/glfw/archive/${pkgver}.tar.gz")
sha512sums=('5d8a8da76c7554cbf56c484ca3d8b6dc81ca2a8ac80ba6920a182209ee589edbe57ee2ef4ad6624871ce2ec754b581f227f4da42e9f5d338f3609fc29306f99d')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver"/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
