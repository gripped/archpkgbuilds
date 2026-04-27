# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonpickle
pkgver=4.1.1
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
sha512sums=('4da4c54ac570d54e1967709c015620a708a161a954c91fc0c0c72c10d39879fe1591bdc465379e70ae33ee6657378808dca05800c6c504f43d1e2c746fd62e29')

prepare() {
  cd jsonpickle
  # do not run coverage in an integration test
  sed -i 's/--cov//' pytest.ini
}

build() {
  cd jsonpickle
  python -m build --wheel --no-isolation
}

check() {
  cd jsonpickle
  pytest tests
}

package() {
  cd jsonpickle
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
