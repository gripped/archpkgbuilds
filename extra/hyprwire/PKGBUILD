# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprwire
pkgver=0.2.1
pkgrel=2
pkgdesc='A fast and consistent wire protocol for IPC'
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprutils libhyprutils.so
         libffi libffi.so
         pugixml) # libpugixml.so
makedepends=(cmake)
provides=(libhyprwire.so)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a6370db771213fe10ebca5a2da748070a7034b09131847f973fda5d60b473c11')

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
