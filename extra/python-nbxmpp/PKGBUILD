# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="A Python library to use Jabber/XMPP networks in a non-blocking way"
pkgver=5.0.1
pkgrel=1
arch=(any)
url="https://dev.gajim.org/gajim/python-nbxmpp/"
license=(GPL-3.0-or-later)
depends=('libsoup3' 'python' 'python-gobject' 'python-idna' 'python-precis_i18n' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://dev.gajim.org/gajim/python-nbxmpp/-/archive/$pkgver/python-nbxmpp-$pkgver.tar.gz")
sha256sums=('d8fb7451543a8551c7960bbd72dabbb801a37a4f8af32443998e2a0600a6369c')
b2sums=('bf90844d2af0ef66ef66402f52490e7e504b3974527ffc5235a1730c45350e38d1dae618e52dde380d0b2a17421b3b0935ac02d6f04f07d1551bb3bc2fbc9c7a')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
