# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aaron Blasko <blaskoazzolaaaron [at] gmail.com>

pkgname=xdg-desktop-portal-hyprland
pkgver=1.5.0
_protocolver=044a434ec371f985655389bcef09286b1af3d77c
pkgrel=1
pkgdesc='xdg-desktop-portal backend for hyprland'
url="https://github.com/hyprwm/$pkgname"
arch=(x86_64)
license=(MIT)
provides=(xdg-desktop-portal-impl)
depends=(
         libgcc
         libstdc++
         glibc
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         hyprtoolkit
         libinih
         pipewire
         qt6-base
         sdbus-cpp libsdbus-c++.so
         util-linux-libs libuuid.so
         xdg-desktop-portal
)
makedepends=(cmake
             hyprland-protocols
             hyprwayland-scanner
             wayland
             wayland-protocols)
optdepends=('grim: required for the screenshot portal to function'
            'slurp: support for interactive mode for the screenshot portal')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "https://github.com/hyprwm/hyprland-protocols/archive/$_protocolver.tar.gz")
sha256sums=('8f9eddad706b0bbca2dc24f9894e07969ec5aed163249d6eac3932cfaf38e6a9'
            'da075667ab2aecb271f6cbd49490f14c725f417d7522c49269decf7f14431d3e')

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
