# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-voluptuous
pkgver=0.14.0
pkgrel=1
pkgdesc="A Python data validation library"
url="https://github.com/alecthomas/voluptuous"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/alecthomas/voluptuous/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('c5acbcdd05a930438c75081cbe9b4c29fdf82849ad4af02041efd4ab0f9f200fcb1554d6868f548de9f466e825e7daf59d5a0db928a16ff713e1c9004bf833b0')

build() {
  cd voluptuous-$pkgver
  python setup.py build
}

check() {
  cd voluptuous-$pkgver
  pytest
}

package() {
  cd voluptuous-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
