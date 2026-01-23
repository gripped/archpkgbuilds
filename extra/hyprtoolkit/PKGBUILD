# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprtoolkit
pkgver=0.5.3
pkgrel=1
pkgdesc='A modern C++ Wayland-native GUI toolkit'
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         aquamarine libaquamarine.so
         cairo libcairo.so
         glib2 libglib-2.0.so
         glibc # libc.so libm.so
         hyprgraphics libhyprgraphics.so
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         iniparser libiniparser.so
         libdrm # libdrm.so
         libglvnd libEGL.so libOpenGL.so
         libxkbcommon libxkbcommon.so
         mesa # libgbm.so
         pango libpango-1.0.so # libpango.so
         pixman libpixman-1.so
         wayland libwayland-client.so)
makedepends=(cmake)
provides=(libhyprtoolkit.so)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7e6671fd4bf6f4b1eda0115aa187aa183db40d59049cca1d7546fb46fdb4cdc0')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake -B build -W no-dev ${cmake_options[@]}
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
