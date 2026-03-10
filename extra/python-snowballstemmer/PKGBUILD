# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: xantares

pkgname=python-snowballstemmer
pkgver=3.0.0.1
pkgrel=1
arch=('any')
pkgdesc="Snowball stemming library collection for Python"
url='https://snowballstem.org'
license=('BSD-3-Clause')
depends=('python')
optdepends=('python-pystemmer: for improved performance')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/snowballstemmer/snowballstemmer-$pkgver.tar.gz")
sha512sums=('6970ecc4188f714df19c6eb6415368774726e54c3c574ac34a866532385bb3e89eaff28bbac2c3820f8d393c7d4e852ada8689986f0aad7c18aa8cf9d5879772')

build() {
  cd snowballstemmer-$pkgver
  python setup.py build
}

check() {
  cd snowballstemmer-$pkgver/src
  PYTHONPATH=. python sample/testapp.py english "what's this"
}

package() {
  cd snowballstemmer-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
