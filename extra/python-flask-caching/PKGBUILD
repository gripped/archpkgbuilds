# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-caching
pkgver=2.3.1
_commit=e59bc040cd47cd2b43e501d636d43d442c50b3ff
pkgrel=3
pkgdesc="A caching extension for Flask"
url="https://github.com/pallets-eco/flask-caching"
license=('BSD-3-Clause')
arch=('any')
depends=(
  'python'
  'python-cachelib'
  'python-flask'
  'python-jinja'
  'python-werkzeug'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'memcached'
  'python-asgiref'
  'python-pylibmc'
  'python-pytest'
  'python-pytest-xprocess'
  'python-redis'
  'valkey'
)
optdepends=(
  'python-pylibmc: for memcached backend'
  'python-redis: for Redis backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('5b324227b26dd9566dc866ffcadcac56a6fdca3f0bb2e7e93c4f2e282de1d320bb33eeff8689b3c6c762ae455a9e2f2ef9d49c5de7193ef2105595993d5bf4ae')

build() {
  cd ${pkgname#python-}-$_commit
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$_commit
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$_commit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
