# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Antoine Pierlot-Garcin <antoine at bokbox dot com>

pkgname=python-pykka
pkgver=4.1.0
pkgrel=1
pkgdesc="Easy to use concurrency abstractions for Python using the actor model"
arch=('any')
url="http://pykka.readthedocs.org/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-gevent: Use gevent based actors from pykka.gevent')
source=("https://pypi.python.org/packages/source/p/pykka/pykka-$pkgver.tar.gz")
sha512sums=('b894f159025f8d5d87bc19723c3b7dacf295e0e657a2c3d7fea2b751ac1e6998dc429bec08f0437248f67ef0b76c9244d36ad0878e3a5d67037ceab41b3f208c')

build() {
  cd "pykka-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "pykka-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
