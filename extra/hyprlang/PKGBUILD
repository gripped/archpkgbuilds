# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlang
pkgver=0.4.0
pkgrel=1
pkgdesc='implementation library for the hypr config language'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD)
depends=(gcc-libs
         glibc)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d50e66a46445fc322e3a0065ad1b86799d3c1e9d22d5a179f74b71e520aa82bb')

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
