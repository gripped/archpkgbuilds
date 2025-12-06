# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: l0gic <l0gic@invalid.invalid>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname=hyprsunset
pkgver=0.3.3
pkgrel=4
pkgdesc='An application to enable a blue-light filter on Hyprland'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         wayland libwayland-client.so)
makedepends=(cmake
             hyprland-protocols
             hyprwayland-scanner
             wayland-protocols)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('cf2b3cc836bdeb7ac3ae78cf98e8cc4a06093e8d8215ff4da2380843dcf1a5dc')

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
