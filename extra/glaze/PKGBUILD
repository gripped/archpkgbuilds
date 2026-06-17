# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=glaze
pkgver=7.8.2
pkgrel=1
pkgdesc='An Extremely fast, In-Memory JSON and Interface Library for Modern C++'
arch=(any)
url="https://github.com/stephenberry/$pkgname"
license=(MIT)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a315bdc20bbdf23b0baae6c844818283aaab7c8ff0f88987f248bec51494d259')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_TESTING=OFF \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
