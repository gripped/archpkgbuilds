# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlang
pkgver=0.4.2
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
sha256sums=('a365ee660f4456e7d4d21f0153563c00146f2c9fb9f1e7b5a6ab12fce924f6f8')

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
