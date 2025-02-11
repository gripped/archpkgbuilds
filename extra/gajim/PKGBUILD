# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.9.5
pkgrel=3
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'gspell: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue2: share current location'
            'gsound: Notification Sounds'
            'libayatana-appindicator: for App Indicator on Wayland'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP'
            'emoji-font: for emojis support')
source=("https://dev.gajim.org/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz"
        'strip_gzip_timestamps.patch')
sha512sums=('63138537a384d0914c05ad42d1fa2b4e06805c59180a286fca91fd57ab78ed04f6deaef74ba7285a63c91c750bc94e66c39dfe7f33f3a48f9637aae5428cd3a4'
            '053f1a209c71da9cc14634b53aaba1f866d66d7290f6a01216b7006b6b7d2bbc44418a2de747af411092003e1b4493003c2f9e3f782e24ebee2ea0db8540705a')
b2sums=('35d46dac13f71fc2f07a098ff041e6d785742c569448606f0021fca3e3c1607fd911079873dfb0bd58dd300239ee19569ae36aa3c11ca25f8b97c6ef7f5d3b6b'
        'c5a65f74dbb905eb349934ec5e90186bae323d77b1b328bdeecbad928b53ade7189414f3a026a63cff67270d107512fbb494bcc1c8f153a58997308eefbe12f9')


prepare() {
	cd "${pkgname}-${pkgver}"
	# Strip gzip timestamps for reproducibility
	# See https://dev.gajim.org/gajim/gajim/-/issues/12140
	patch -Np1 -i "${srcdir}/strip_gzip_timestamps.patch"
}

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
