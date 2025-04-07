# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprgraphics
pkgver=0.1.3
pkgrel=3
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
         libspng libspng.so
         libwebp libwebp.so
         pixman)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0e11457135a9e7160cf147d361fae3c5dc40035a4ebd894c5d409baa896f43cf')

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
