# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprland-guiutils
pkgver=0.1.0
pkgrel=2
pkgdesc='Hyprland GUI utilities'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprlang
         hyprtoolkit libhyprtoolkit.so
         hyprutils libhyprutils.so
         libdrm
         pixman)
makedepends=(cmake)
replaces=(hyprland-qtutils)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4edb387a49b29cc547c991e3238a3e6de69336408ba4d9881ab1ba4d6a9dd542')

build() {
	cd "$_archive"
	local cmake_flags=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake -B build ${cmake_flags[@]}
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
