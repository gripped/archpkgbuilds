# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-caching
pkgver=2.4.0
pkgrel=1
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
  'python-flit-core'
  'python-installer'
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
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5809b883e880dca6322d5bd0c147ec731076d1c9f1601e12335b7870d673d309bfe32d7b9a1f651c5cd28ff13c52bf078ad573090fe906d1e72793b8a07e15c4')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # test_generic_inc_dec: cachelib 0.13.0's RedisSerializer always pickles,
  #   so INCRBY fails on plain ints - upstream incompatibility.
  # DeprecationWarning: redis-py >= 5.3.0 deprecated get_connection() args.
  test-env/bin/python -m pytest \
    -W ignore::DeprecationWarning \
    --deselect tests/test_backend_cache.py::TestRedisCache::test_generic_inc_dec
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
