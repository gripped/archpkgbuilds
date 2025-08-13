# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="A Python library to use Jabber/XMPP networks in a non-blocking way"
pkgver=6.3.0
pkgrel=1
arch=(any)
url="https://dev.gajim.org/gajim/python-nbxmpp/"
license=(GPL-3.0-or-later)
depends=('libsoup3' 'python' 'python-gobject' 'python-idna' 'python-precis_i18n' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://dev.gajim.org/gajim/python-nbxmpp/-/archive/$pkgver/python-nbxmpp-$pkgver.tar.gz")
sha256sums=('959460ac6a5625ea4468b691e1b6027edfd908bb9230c71b24ce64b0a1de624a')
b2sums=('de47a6b9794d4edc1361217253d67d52c3640417f9de4ccd3d521bb3a9aaedc53f10f847b112f5d66f71688dd9fb45d038b354610af5fb060c08ce3f607410b2')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
