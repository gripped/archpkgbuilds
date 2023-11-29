# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-wayland-protocols
pkgver=1.11.1
pkgrel=2
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL)
depends=()
makedepends=(extra-cmake-modules
             qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/libraries/plasma-wayland-protocols/-/commit/a95fc86f.patch)
sha256sums=('451aa890431cee5066fa93bf8c03640a18b5595621a18a35b1f777afd50186cd'
            'SKIP'
            'b1ef30d3d28b45ce5a615604048ab3096242d146f24817f827518fb5c56a7dde')
validpgpkeys=(CA1B4E348D22755A67EF4E1A6A4F2C4CDC8BC77F  # Aleix Pol Gonzalez <aleixpol@kde.org>
              EC5516B514543DA145169FD12276F09AF4A790F4) # Vlad Zahorodnii <vlad.zahorodnii@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < a95fc86f.patch # Backport changes needed by Plasma beta
}

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
