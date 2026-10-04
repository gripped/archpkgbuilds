# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=unordered_dense
pkgver=5.3.0
pkgrel=1
pkgdesc="A fast and densely stored hashmap and hashset"
arch=(any)
url="https://github.com/martinus/unordered_dense"
license=(MIT)
makedepends=(cmake git)
source=("git+https://github.com/martinus/unordered_dense.git#tag=v${pkgver}")
sha256sums=('59d4c929fc9707c43693a6d02d0d99c5945f05802b57a1cfcaef187041e5f162')

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
