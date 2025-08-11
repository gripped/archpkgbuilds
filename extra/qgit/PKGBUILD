# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=qgit
pkgver=2.12
pkgrel=1
pkgdesc='A GIT GUI viewer built on Qt/C++'
url="https://github.com/tibirna/$pkgname"
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(cmake)
depends=(git
         hicolor-icon-theme
         qt6-5compat
         qt6-base
         qt6-svg)
optdepends=(source-highlight)
source=("git+$url.git#tag=$pkgname-$pkgver")
sha256sums=('f3e4c19ffb96290637796c2f3ef00a11388a33915bb38933d3afae277eee9831')

prepare() {
	cd "$pkgname"
	mkdir -p build
}

build() {
	cd "$pkgname/build"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir" install
}
