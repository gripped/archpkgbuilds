# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=glaze
pkgver=4.3.1
pkgrel=1
pkgdesc='An Extremely fast, In-Memory JSON and Interface Library for Modern C++'
arch=(any)
url="https://github.com/stephenberry/$pkgname"
license=(MIT)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('934b16d0a00dfc2b06bc2920a6444b8a6a34edb4f0fe872f8ad7a044518a37e3')

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
