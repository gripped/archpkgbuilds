# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=unordered_dense
pkgver=5.2.0
pkgrel=1
pkgdesc="A fast and densely stored hashmap and hashset"
arch=(any)
url="https://github.com/martinus/unordered_dense"
license=(MIT)
makedepends=(cmake git)
source=("git+https://github.com/martinus/unordered_dense.git#tag=v${pkgver}")
sha256sums=('08ac5ea8120ced1c885fe235bb60ba1d155b46cf971a3988fa4dfb79f3d3a1b6')

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
