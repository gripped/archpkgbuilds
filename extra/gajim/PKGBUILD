# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=2.3.3
pkgrel=1
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'libadwaita' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji')
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
sha512sums=('0998330b006b150113f275a5eb6e8c7fbddcfda07a244141407d94634d84495d10715487f7f61f99ada6971b12eeaa8eab5564b0f46ff13686b126626b221a40')
b2sums=('87022156c305987c56b46fae26769ec6ff4a64ab7e9ee3c0bf436dc538ad1aa576f8f1bdb0f1b48145d4c89d28ebb55bfe8023bcd9d29530bf793c916635ac27')


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
