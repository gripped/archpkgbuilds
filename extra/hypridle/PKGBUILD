# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hypridle
pkgver=0.1.7
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
sha256sums=('c4ef2e2894fc2082cfdabe7db086b1f246e3f0de571f7f2c6b26d7c0d9a5f8f3')

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
