# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprgraphics
pkgver=0.1.5
pkgrel=2
pkgdesc='hyprland graphics resources and utilities'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(cairo # libcairo.so
         file libmagic.so
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprutils libhyprutils.so
         libjpeg-turbo libjpeg.so
         libjxl libjxl.so libjxl_threads.so
         libpng # libpng.so
         libwebp libwebp.so
         pixman)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('03bdd5a6e456c31cc17f973656326220f94e58a5f4ab33b2450ccb5d6a697a4c')

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
