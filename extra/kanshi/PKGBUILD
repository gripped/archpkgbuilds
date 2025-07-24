# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Antoine Damhet

pkgname=kanshi
pkgver=1.8.0
pkgrel=1
pkgdesc='Dynamic output configuration for Wayland WMs'
arch=(x86_64)
url="https://wayland.emersion.fr/kanshi/"
license=('MIT')
depends=(
  'glibc'
  'libscfg.so'
  'libvarlink'
  'wayland'
)
makedepends=(
  'meson'
  'scdoc'
)
source=(
  "https://gitlab.freedesktop.org/emersion/kanshi/-/releases/v1.8.0/downloads/kanshi-$pkgver.tar.gz"
  "https://gitlab.freedesktop.org/emersion/kanshi/-/releases/v1.8.0/downloads/kanshi-$pkgver.tar.gz.sig"
)
sha256sums=('d82760e139cedc7d120f0f8446f1f39710009574faf393f78c224c316f3ad56c'
            'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')  # Simon Ser (emersion)

build() {
  meson --prefix=/usr \
    --buildtype=plain \
    -Dman-pages=enabled \
    -Dipc=enabled \
    "$pkgname-$pkgver" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  cd "$pkgname-$pkgver"
  install -vDm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm0644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
