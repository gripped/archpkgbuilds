# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=glaze
pkgver=5.0.2
pkgrel=1
pkgdesc='An Extremely fast, In-Memory JSON and Interface Library for Modern C++'
arch=(any)
url="https://github.com/stephenberry/$pkgname"
license=(MIT)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ed47ba0b5dcef5a2d2a41b4863e91a3b509c469a70c1a1fed885545d1b672681')

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
