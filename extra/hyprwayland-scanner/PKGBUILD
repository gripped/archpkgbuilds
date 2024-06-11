# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprwayland-scanner"
pkgver=0.3.10
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++"
arch=(x86_64)
url="https://github.com/hyprwm/hyprwayland-scanner"
license=('BSD-3-Clause')
depends=('pugixml')
makedepends=('git' 'cmake' 'gcc')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(hyprwayland-scaner)
sha256sums=('94e40cf712a00daf9fbab6b2210ef8640ee7dbf233e82b4d8dcd8b0e01d15252')

build() {
	cd "$_archive"
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -B build
	cmake --build build --config Release
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
