# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer
_pkgname="${pkgname}-linux"
pkgver=4.4
pkgrel=1
pkgdesc="Android MTP client with minimalistic UI"
url="https://whoozle.github.io/android-file-transfer-linux"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('qt6-base' 'fuse2' 'libxkbcommon-x11' 'hicolor-icon-theme' 'file' 'android-udev')
makedepends=('cmake' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whoozle/android-file-transfer-linux/archive/v${pkgver}.tar.gz")
sha256sums=('d8225cad6eb2e120afd4c82232030d74fd480e666a0fcc4ab93f4cd57620f7c8')

build() {
	cmake -B build -S "${_pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffat-lto-objects" \
		-Wno-dev
	cmake --build build

	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
}
