# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.8.2
pkgrel=1
pkgdesc="Window Manager designed for speed, usability, and consistency"
url="https://ice-wm.org/"
arch=('x86_64')
license=('LGPL-2.0-only')
depends=('alsa-lib' 'imlib2' 'librsvg' 'libsndfile' 'libxcomposite' 'libxdamage' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('asciidoctor' 'cmake' 'xorg-mkfontscale')
optdepends=('perl: for icewm-menu-xrandr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ice-wm/icewm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c18c91cdad7eb2532090466b3f611df12a9f0b45f83cf5a728f5848bd453cff')

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
