# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=13.0.1
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
url="https://github.com/flameshot-org/flameshot"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('qt6-svg' 'hicolor-icon-theme' 'kguiaddons')
makedepends=('qt6-tools' 'cmake' 'git')
optdepends=('gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
            'grim: for wlroots wayland support'
            'xdg-desktop-portal: for wayland support, you will need the implementation for your wayland desktop environment'
            'qt6-imageformats: for additional export image formats (e.g. tiff, webp, and more)')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('548867ae67a5cf0fbb8b2bb5dec2ac4e113c2980eda9abb7878041c374e5afa6')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_WAYLAND_CLIPBOARD=ON \
		-DDISABLE_UPDATE_CHECKER=ON \
		-DUSE_KDSINGLEAPPLICATION=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# Remove vendored static builds of shared libraries (used for single application, which we disable)
	# See https://github.com/flameshot-org/flameshot/blob/v13.0.0/packaging/rpm/fedora/flameshot.spec#L64-L70
	rm -rf "${pkgdir}/usr/include/QtColorWidgets/" \
		"${pkgdir}/usr/include/kdsingleapplication-qt6/" \
		"${pkgdir}/usr/lib/cmake/KDSingleApplication-qt6/" \
		"${pkgdir}/usr/lib/cmake/QtColorWidgets/" \
		"${pkgdir}/usr/lib/libQtColorWidgets.a" \
		"${pkgdir}/usr/lib/libkdsingleapplication-qt6.a" \
		"${pkgdir}/usr/lib/pkgconfig/QtColorWidgets.pc"
	rmdir "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/"{cmake,pkgconfig,}
}
