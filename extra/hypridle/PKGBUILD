# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hypridle
pkgver=0.1.4
pkgrel=1
pkgdesc='hyprland’s idle daemon'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprlang libhyprlang.so
         sdbus-cpp libsdbus-c++.so
         wayland libwayland-client.so
         wayland-protocols)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4a878917be65ab2df24f9036846339610861b845b9f1bb9ca0bdffdc1e368050')

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
