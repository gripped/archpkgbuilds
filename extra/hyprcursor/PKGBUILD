# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprcursor
pkgver=0.1.12
pkgrel=2
pkgdesc='The hyprland cursor format, library and utilities'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(cairo # libcairo.so
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprlang libhyprlang.so
         librsvg librsvg-2.so
         libzip libzip.so
         tomlplusplus libtomlplusplus.so)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3200a7a31e28884b9d046f8ec7b0aa67ede9ce0ab0d20193c2b61ee522d6b1f2')

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
