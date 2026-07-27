# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hypridle
pkgver=0.1.8
pkgrel=1
pkgdesc='hyprland’s idle daemon'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(libgcc # libgcc_s.so
         'libstdc++' # libstdc++.so
         glibc # libc.so libm.so
         hyprlang libhyprlang.so
         hyprwayland-scanner
         sdbus-cpp libsdbus-c++.so
         wayland libwayland-client.so
         wayland-protocols)
makedepends=(cmake
             hyprland-protocols)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('08703613cc33cc796c2179bcaa6076e8618113f67b938daaf7535f90c7d39595')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
