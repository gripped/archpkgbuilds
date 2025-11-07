# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="A Python library to use Jabber/XMPP networks in a non-blocking way"
pkgver=6.4.0
pkgrel=1
arch=(any)
url="https://dev.gajim.org/gajim/python-nbxmpp/"
license=(GPL-3.0-or-later)
depends=('libsoup3' 'python' 'python-gobject' 'python-idna' 'python-precis_i18n' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://dev.gajim.org/gajim/python-nbxmpp/-/archive/$pkgver/python-nbxmpp-$pkgver.tar.gz")
sha256sums=('75771d2fd27227e66c3b0187e8e72729757c8c511175cee0796f6e2e159de933')
b2sums=('600f0c04e191594695a9c7fb11cae30ddc4b9e4d5a01c8eaa5f51b7f4ad44d6b38d86787d92b8ce5c7b893381a301d309bd422b171c99b67e31b12481a556482')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
