# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.7.4
pkgrel=1
pkgdesc="Window Manager designed for speed, usability, and consistency"
url="https://ice-wm.org/"
arch=('x86_64')
license=('LGPL-2.0-only')
depends=('alsa-lib' 'imlib2' 'librsvg' 'libsndfile' 'libxcomposite' 'libxdamage' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('asciidoctor' 'cmake' 'xorg-mkfontscale')
optdepends=('perl: for icewm-menu-xrandr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ice-wm/icewm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1e9998edbb79c8c33effc97ebc04f49a072b8327721b406a894d5d2a11912508')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# Remove the directory tree created for development purposes only (e.g. the playground locale dir)
	# See https://github.com/ice-wm/icewm/commit/5d735df293e61fd94e114ef58e800d757f98d01c
	rm -rf "${pkgdir}/build"
}
