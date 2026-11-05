# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=2.7.0
pkgrel=1
pkgdesc="Full featured and easy to use XMPP (Jabber) client"
url="https://gajim.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'gstreamer' 'libadwaita' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite' 'python-sqlalchemy' 'python-emoji' 'python-httpx2' 'python-truststore' 'python-h2' 'python-socksio' 'emoji-font' 'python-pysequoia')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-dbus: to have gajim-remote working'
            'python-sentry_sdk: for Sentry error reporting (users decide whether to send reports or not)'
            'libspelling: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue: share current location'
            'gsound: Notification Sounds'
            'farstream: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk4: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gpgme: encrypting chat messages with OpenPGP')
source=("https://gitlab.com/gajim/gajim/-/archive/${pkgver}/gajim-${pkgver}.tar.gz")
sha512sums=('a6082e9911da2621c51b8f40447ffa0d73f596106df9c5fcf554aa1777fa457aa122c75dd40c1b69669edd68a65b56f03661e5a71db4f34866ce0e108d16d4f8')
b2sums=('963c7e05b69c83274b6a98a0cefff398c66edd5b9c7695a94972015714081a8415c0ab679c5d8c44922337bd74a55a7477ff37343eee3f8006b1f8593d1be1e1')


build() {
	cd "${pkgname}-${pkgver}"
	./make.py build --dist unix
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir=tmp_install dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	export PATH="$PWD/tmp_install/usr/bin:$PATH"
	export PYTHONPATH="$PWD/tmp_install/$site_packages"
	python -m unittest discover -s tests
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	./make.py install --dist unix --prefix="${pkgdir}/usr"
}
