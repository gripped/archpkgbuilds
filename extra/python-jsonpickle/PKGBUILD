# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonpickle
pkgver=4.1.2
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
sha512sums=('a9f116386a1a4620fb97ac7d22f3aa5abb73cb1f0ea41e5b066b818575595a4f3b15a61c9e1fcbcc782fd6a5d3622310dd86f446634687de8982177cf809c2fb')

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
