# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname=hyprutils
pkgver=0.13.1
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
sha256sums=('480ee026105deea64a24eb96d80cabe54b357594ce36cb05c021ea226c69aede')

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
