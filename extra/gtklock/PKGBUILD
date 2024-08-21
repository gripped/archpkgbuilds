# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jovan Lanik <jox969@gmail.com>

pkgname=gtklock
pkgver=3.0.0
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
url="https://github.com/jovanlanik/gtklock"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('pam' 'wayland' 'gtk3' 'gtk-session-lock')
makedepends=('meson' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a65e8636680c1fb11c449ecb0c88771345a9535150b7a372bc615def6bea2c7c')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}

