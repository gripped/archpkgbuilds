# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=remmina
epoch=1
pkgver=1.4.42
pkgrel=1
pkgdesc="Remote desktop client written in GTK+"
url="https://www.remmina.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('avahi' 'bash' 'cairo' 'curl' 'gcc-libs' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'json-glib' 'libayatana-appindicator' 'libgcrypt'
	 'libsodium' 'libssh' 'libx11' 'openssl' 'pango' 'python' 'vte3')
makedepends=('cmake' 'freerdp' 'gobject-introspection' 'gtk-vnc' 'harfbuzz'
             'kwallet5' 'libvncserver' 'ninja' 'spice-gtk' 'spice-protocol'
             'webkit2gtk-4.1' 'xorgproto')
optdepends=('freerdp: RDP plugin'
            'libsecret: Secret plugin'
            'libvncserver: VNC plugin'
            'spice-gtk: Spice plugin'
            #'pyhoca-cli: X2Go plugin'
            'webkit2gtk-4.1: WWW plugin'
            'gtk-vnc: GVNC plugin'
            'kwallet5: kwallet plugin'
            'gnome-terminal: external tools')
replaces=('remmina-plugins')
provides=('remmina-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/Remmina/Remmina/-/archive/v${pkgver}/Remmina-v${pkgver}.tar.gz")
sha512sums=('20cf17699c85c1ba6e82a6607ef6dc807f22f569b3c9eb7eee87f4b26bc49f465d3dff6cc6fc5a6fffbb71cf868e2cd7d7b689d52b25b2617af4bfa6163015dd')

build() {
	cmake -S "Remmina-v${pkgver}" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='/usr/lib' \
		-DWITH_APPINDICATOR='ON' \
		-DWITH_FREERDP3='ON' \
		-DWITH_NEWS='OFF' \
		-DWITH_KF5WALLET='ON' \
		-DWITH_X2GO='ON' \
		-DWITH_GVNC='ON' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
