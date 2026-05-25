# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: xantares

pkgname=python-snowballstemmer
pkgver=3.1.0
pkgrel=1
arch=('any')
pkgdesc="Snowball stemming library collection for Python"
url='https://snowballstem.org'
license=('BSD-3-Clause')
depends=('python')
optdepends=('python-pystemmer: for improved performance')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://pypi.python.org/packages/source/s/snowballstemmer/snowballstemmer-$pkgver.tar.gz")
sha512sums=('02d3022c76c3e6da37c599b9a58855e538ce5bddf0533c4b32ffeb44e426cbf998f20746c9563a5e05956c3118ce985a5129573f4342bdc94ed2dc1d1d62214d')

build() {
  cd snowballstemmer-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd snowballstemmer-$pkgver/src
  PYTHONPATH=. python sample/testapp.py english "what's this"
}

package() {
  cd snowballstemmer-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
