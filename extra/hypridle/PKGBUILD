# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hypridle
pkgver=0.1.6
pkgrel=6
pkgdesc='hyprland’s idle daemon'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
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
sha256sums=('ea4faf92e7ef303a538551e2b0ea67a557b2d711574993a5a3fea3b27667dc63')

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
