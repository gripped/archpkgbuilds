# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprshutdown
pkgver=0.1.2
pkgrel=3
pkgdesc='A graceful shutdown utility for Hyprland '
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(glibc # libc.so libm.so
         hyprtoolkit libhyprtoolkit.so
         hyprutils libhyprutils.so
         libdrm # libdrm.so
         libgcc libgcc_s.so
         libstdc++ libstdc++.so
         pixman)
makedepends=(cmake
             glaze)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c4f1d52830e3d1865b496453094ac74174fc8914b699510892947d8fd3fbdad0')

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
