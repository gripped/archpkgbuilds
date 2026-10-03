# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonpickle
pkgver=4.1.3
pkgrel=1
arch=('any')
pkgdesc="Python library for serializing any arbitrary object graph into JSON"
url="https://jsonpickle.github.io/"
license=('BSD-3-Clause')
depends=('python')
optdepends=("python-numpy: for serializing sklearn models, numpy arrays, and other numpy-based data"
            "python-gmpy2: for serializing ecdsa module's keys")
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-numpy' 'python-feedparser' 'python-simplejson' 'python-gmpy2'
              'python-pymongo' 'python-ujson' 'python-pandas' 'python-pytest')
source=("git+https://github.com/jsonpickle/jsonpickle.git#tag=v$pkgver")
sha512sums=('f7d4004dc9fb8743df86bc19ac54a9dc0260bbdd65df0ffe865f4e7a87f62eafd2dca7c422c5f28f31f53f82992595106ec796a10437993e9b5fc32cf5b1a79a')

prepare() {
  cd jsonpickle

  # Replace removed NumPy dtype aliases: https://github.com/jsonpickle/jsonpickle/pull/592
  sed -i -e 's/i2,a3,i4/i2,S3,i4/' -e 's/u1,f4,a1/u1,f4,S1/' tests/numpy_test.py
}

build() {
  cd jsonpickle
  python -m build --wheel --no-isolation
}

check() {
  cd jsonpickle
  pytest -W "ignore:keys will default to True in jsonpickle 5.0.0:DeprecationWarning" tests
}

package() {
  cd jsonpickle
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
