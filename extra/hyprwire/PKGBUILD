# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprwire
pkgver=0.3.0
pkgrel=1
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
sha256sums=('ba3ff4b82620209d5680ce0e771d0f2c41f78cdb96d5d84fa66e4f0709ca8de6')

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
