# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=2.4.1
pkgrel=2
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'libadwaita' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji' 'python-httpx' 'python-truststore' 'python-h2' 'python-socksio')
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
source=("https://dev.gajim.org/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz"
        "fix_missing_gst.patch::https://dev.gajim.org/gajim/gajim/-/commit/e4d3fd7dcce3c3261a13eaaa2b75cb5a2d86130f.patch")
sha512sums=('9b6806a106b6a66bc3663563e43e38cd33e7d0950edee189f452e3f3a540e90a4ac1890d55bd2bd614a778f451c6514ea84f24f5ca8fb9b7c0104bc6448ff797'
            '576de87aa477223414eb9db50ec0a23479371605f7f562ed1eb2ab7e642a48841737c03543f8d6d5804d09638325a489bc4efe583f29526fe6e9b19b809ce99f')
b2sums=('6d2817987f0e1af4f03936496ba0d036cc8f16d8f1b38edd53d4761c92f25fcb1744d5b3e1a460e4067e3033b0f7ea6e74f8e805b188aa97b4d36c18edcc1705'
        '3c64e7d8d8535735c0c004dbccf6a9735768f35734184646440e5024dd0cf088aecc31e789b268ffce838f2b1f481a58ba5a0cae6d402bf769706ef81dbe18de')


prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/fix_missing_gst.patch"
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
