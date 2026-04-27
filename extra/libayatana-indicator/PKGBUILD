# Maintainer:
# Contributor: Robert Tari <robert at tari dot in>

pkgname=libayatana-indicator
pkgver=0.9.4
pkgrel=2
pkgdesc='Ayatana Indicators shared library'
arch=(x86_64)
url='https://github.com/AyatanaIndicators/libayatana-indicator'
license=(GPL-3.0-or-later)
depends=(ayatana-ido gdk-pixbuf2 glib2 glibc gtk3)
makedepends=(cmake gobject-introspection vala git glib2-devel)
source=("git+$url#tag=$pkgver")
sha256sums=('d96f57213a8b4fb165ef99b1f537dca294b79f0fda1431652141813a0fd36aae')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
