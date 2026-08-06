# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python-logbook
pkgver=1.10.0
pkgrel=1
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-setuptools' 'python-setuptools-rust' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('valkey' 'python-pytest' 'python-sqlalchemy' 'python-redis' 'python-pyzmq'
              'python-execnet' 'python-jinja' 'python-brotli' 'pifpaf')
source=("git+https://github.com/mitsuhiko/logbook.git#tag=$pkgver")
sha512sums=('b8ffe89a0e3ecce312b9f3b33d66634ca4e1a10a7d02a84831c4907d791006e9345d3aa370da240dbe5044f7a25700df1589ee0bff0db7baec46372ed9d0f328')

prepare() {
  cd logbook
  python -m build --wheel --no-isolation
}

build() {
  cd logbook
}

check() {
  cd logbook
  LC_CTYPE=en_US.UTF-8 PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=src pifpaf run redis py.test tests
}

package() {
  cd logbook
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm664 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
