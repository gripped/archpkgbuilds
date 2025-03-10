# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="A Python library to use Jabber/XMPP networks in a non-blocking way"
pkgver=6.0.1
pkgrel=1
arch=(any)
url="https://dev.gajim.org/gajim/python-nbxmpp/"
license=(GPL-3.0-or-later)
depends=('libsoup3' 'python' 'python-gobject' 'python-idna' 'python-precis_i18n' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://dev.gajim.org/gajim/python-nbxmpp/-/archive/$pkgver/python-nbxmpp-$pkgver.tar.gz")
sha256sums=('134db34999ba2205e0eab558b95287e39f88e5bf7543de7e4314b999ecd60b43')
b2sums=('0575e6c24362aa93c4cb5d81f1c1fdc4d0963c636c97d9b74fa3acfce8a82f594511e6728273269fe010a894f3299a71c4851d3a0241d1c36f3b30b76cb25f96')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
