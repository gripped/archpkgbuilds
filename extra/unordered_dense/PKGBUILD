# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=unordered_dense
pkgver=5.3.1
pkgrel=1
pkgdesc="A fast and densely stored hashmap and hashset"
arch=(any)
url="https://github.com/martinus/unordered_dense"
license=(MIT)
makedepends=(cmake git)
source=("git+https://github.com/martinus/unordered_dense.git#tag=v${pkgver}")
sha256sums=('1d3c3ac84ac53a5e059fc012dfd4fe8ba1b8626ca383a80c53f51a4b1bd1ca95')

build() {
	cmake \
		-B build \
		-S unordered_dense \
		-W no-author \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 unordered_dense/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
