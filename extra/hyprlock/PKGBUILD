# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlock
pkgver=0.9.2
pkgrel=8
pkgdesc='hyprland’s GPU-accelerated screen locking utility'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(cairo # libcairo.so
         gcc-libs # libgcc_s.so libstdc++.so
         glib2 libgobject-2.0.so libglib-2.0.so
         glibc # libc.so libm.so
         hyprgraphics libhyprgraphics.so
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         hyprwayland-scanner
         libdrm # libdrm.so
         libglvnd libOpenGL.so libEGL.so
         libxkbcommon libxkbcommon.so
         mesa # libgbm.so
         pam libpam.so
         pango libpango-1.0.so libpangocairo-1.0.so
         sdbus-cpp libsdbus-c++.so
         wayland libwayland-client.so libwayland-egl.so
         wayland-protocols)
makedepends=(cmake)
backup=("etc/pam.d/$pkgname")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d4a8ef9115232b3545dd517e96f1251f91022765eb272b5e7057c20e3e7e8837')

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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
