# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=hyprpicker
pkgver=0.4.5
pkgrel=8
pkgdesc="A wlroots-compatible Wayland color picker that does not suck"
arch=(x86_64)
url="https://github.com/hyprwm/hyprpicker"
license=(BSD-3-Clause)
depends=(
  cairo
  gcc-libs
  glibc
  hyprutils
  hyprwayland-scanner
  libxkbcommon
  wayland
)
makedepends=(
  cmake
  libglvnd
  libjpeg-turbo
  ninja
  pango
  wayland-protocols
  wlroots0.18
)
optdepends=('wl-clipboard: Allows --autocopy to automatically copy the output to the clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fe9611ec78524f9bbea0d39308da3d9c61cb20f6103179a269cad8013bb0c1f3')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
