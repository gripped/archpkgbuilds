# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname=hyprutils
pkgver=0.13.0
pkgrel=1
pkgdesc='Hyprland utilities library used across the ecosystem'
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(pixman  libpixman-1.so)
makedepends=(cmake)
# checkdepends=(gtest)
provides=(libhyprutils.so)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d28e2b76aa13a21ed4efcbfb770542240bb0391ed0513f02c8b453ee7f64aee6')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_TESTING=False
	)
	cmake -W no-dev ${cmake_options[@]} -S . -B ./build
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
