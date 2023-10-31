# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gajim
pkgver=1.8.2
pkgrel=1
pkgdesc='Full featured and easy to use XMPP (Jabber) client'
url='https://gajim.org/'
arch=('any')
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp>=4.3.0' 'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme' 'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging' 'pango' 'sqlite')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
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
            'python-gnupg: encrypting chat messages with OpenPGP')
source=(https://www.gajim.org/downloads/${pkgver%.*}/gajim-${pkgver}.tar.gz)
sha512sums=('ad422084433183af0db3d658810630e11dcdef91042621f8f7bea8b289f5d37e8ea381d6d6150a404b97bba7e6a4c2843b435ab4421aca64ae8d3a05aa52c73f')
b2sums=('a966a75f0df1778be6948c37f4f73acc043250293bd75b3ef2d1f376387ab31f38061ad36d11c651dba2e59d5980ae0cd636aec6219b3ca35fc6284ff2bf00a0')

build() {
  cd ${pkgname}-${pkgver}
  ./pep517build/build_metadata.py -o dist/metadata
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m unittest discover -s test
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  ./pep517build/install_metadata.py dist/metadata --prefix="${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
