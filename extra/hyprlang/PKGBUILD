# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprlang
pkgver=0.3.2
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
sha256sums=('dd4d9546c0307199071b00e68a6eaca19b5ac117da621b3b8db958f2f89dd530')

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
