# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Massimiliano Torromeo < massimiliano DOT torromeo AT gmail DOT com >

_name=beaker
pkgname=python-beaker
pkgver=1.14.0
pkgrel=1
arch=('any')
license=('BSD-3-Clause')
pkgdesc="Caching and sessions WSGI middleware for use with web applications and stand-alone Python scripts and applications"
url="https://beaker.readthedocs.io/en/latest/"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-sqlalchemy'
              'python-pycryptodome' 'python-coverage' 'python-webtest' 'python-redis'
              'python-pymongo' 'valkey' 'python-cryptography'
              'python-memcached' 'memcached' 'pifpaf' 'python-mongomock')
source=("git+https://github.com/bbangert/beaker.git#tag=$pkgver")
sha512sums=('dab7a899cbab35f7326fd366ca31ecf008b58e111abc538ce4267c098f889908286b85891efc8cfd7d9d56c0eb2ba0c8659ab08536f9fbea8ec610c6a09ae3a0')

prepare() {
  cd beaker

  # Use a fake MongoDB for tests
  sed -e '/class TestMongoDB/i import mongomock' \
      -e "s|'mongodb://localhost:27017/beaker_testdb'|mongomock.MongoClient('mongodb://localhost:27017/beaker_testdb')|" \
      -i tests/test_managers/test_ext_mongodb.py

  # Drop tests which require a redis cluster
  rm tests/test_managers/test_ext_rediscluster.py
}

build() {
  cd beaker
  python -m build --wheel --no-isolation
}

check() {
  cd beaker
  # it_IT.UTF-8 is missing in test env
  # test_dbm_container fails with SQLite objects created in a thread can only be used in that same thread.
  pifpaf run memcached --port 11211 -- pifpaf run redis -- \
    pytest --deselect tests/test_cookie_expires.py::test_cookie_expires_different_locale \
	   --deselect tests/test_container.py::test_dbm_container \
	   --deselect tests/test_container.py::test_dbm_container_2 \
           --deselect tests/test_container.py::test_dbm_container_3
}

package() {
  cd beaker
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/python-beaker/
}
