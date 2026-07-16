# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=2.5.0
pkgrel=1
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'libadwaita' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-emoji' 'python-httpx' 'python-truststore' 'python-h2' 'python-socksio' 'emoji-font' 'python-pysequoia')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'libspelling: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue: share current location'
            'gsound: Notification Sounds'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk4: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gpgme: encrypting chat messages with OpenPGP')
source=("https://dev.gajim.org/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz")
sha512sums=('1245025870104fc1d9f25afbf625e84903429078475c8e558d0f1b8c6992f3d7fcac0adcbb4e1fea4762ef813ae34d7464b3c1ed7462eea0e49d70c09908c451')
b2sums=('8a18a73f397dec16dcd3f128cf15db9e75998632fa1ca596835b78b600f2ea501df463911c38feb04e02fda73b82a76a287dcd350cb13b2cab0bd95e7c065307')


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
