# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xdg-desktop-portal-hyprland
pkgver=1.3.10
_protocolver=4d29e48433270a2af06b8bc711ca1fe5109746cd
pkgrel=1
pkgdesc='xdg-desktop-portal backend for hyprland'
url="https://github.com/hyprwm/$pkgname"
arch=(x86_64)
license=(MIT)
provides=(xdg-desktop-portal-impl)
depends=(gcc-libs
         glibc
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         hyprwayland-scanner
         libinih
         pipewire
         qt6-base
         qt6-wayland
         sdbus-cpp libsdbus-c++.so
         util-linux-libs libuuid.so
         xdg-desktop-portal)
makedepends=(cmake
             hyprland-protocols
             wayland
             wayland-protocols)
optdepends=('grim: required for the screenshot portal to function'
            'slurp: support for interactive mode for the screenshot portal')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "https://github.com/hyprwm/hyprland-protocols/archive/$_protocolver.tar.gz")
sha256sums=('5f7b1d83e700ecfa702dfc4c6da1dfdc5d9b1239e8b7d8dd3986116327d84bbf'
            '5f6be4d870e94314f05ec7ff9c9c1f028748230ff80a7f89aeaf66c08e5c70e0')

prepare() {
	cd "$_archive/subprojects"
	rm -rf hyprland-protocols sdbus-cpp
	ln -sfT "$srcdir/hyprland-protocols-$_protocolver" hyprland-protocols
}

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_INSTALL_LIBEXECDIR=/usr/lib \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
