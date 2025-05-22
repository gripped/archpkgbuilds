# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=2.2.0
pkgrel=1
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'libspelling: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue2: share current location'
            'gsound: Notification Sounds'
            'gsound: Notification Sounds'
            'libayatana-appindicator: for App Indicator on Wayland'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk4: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP'
            'emoji-font: for emojis support'
            'webp-pixbuf-loader: for WebP images support')
source=("https://dev.gajim.org/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz")
sha512sums=('0613053171d0fc4e00a8497f7331363f34e71530c45b635f9b82f8606f8be9641d004f4599312fe5f88795d2f0c934d0f8a192e008351883a715ba7d5c45810c')
b2sums=('38af487f17865003f923d740b8fc421eab1f8b7dcf01e7db1c7a1770e6e3b34a4d6bd6c3e4c1d3c434c5297035ee942fe68df57416f0a855dda5d58129c780de')


build() {
	cd "${pkgname}-${pkgver}"
	./make.py build --dist unix
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m unittest discover -s test
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	./make.py install --dist unix --prefix="${pkgdir}/usr"
}
