# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname=hyprutils
pkgver=0.2.6
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64)
url="https://github.com/hyprwm/hyprutils"
license=(BSD-3-Clause)
depends=(pixman)
makedepends=(git cmake)
provides=(libhyprutils.so)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6a6098590da0da2a755c2ea8e91629c810d20784c236d1a9e2c46eebb2c1a3f')

build() {
	cd "${pkgname}-${pkgver}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
