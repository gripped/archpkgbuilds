# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlang
pkgver=0.3.0
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
sha256sums=('6355ae011b1d9d77f95d435fd79582a547cf08db3c0189f2a4ed0a6a25d9b4a1')

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
