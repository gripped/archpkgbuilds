# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mongomock
pkgver=4.2.0
pkgrel=1
pkgdesc="Fake pymongo stub for testing simple MongoDB-dependent code"
url="https://github.com/mongomock/mongomock"
license=('ISC')
arch=('any')
depends=('python-sentinels' 'python-packaging' 'python-pytz')
makedepends=('git' 'python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer')
checkdepends=('python-pymongo' 'python-pytest')
source=("git+https://github.com/mongomock/mongomock.git#tag=$pkgver")
sha512sums=('2c251dbe23a1706c87cfcf1ac5f7d1a9dc1bf63bf14e2b2957f2266554de96f341774ebc0acc98852da6447ebcf891d49cf5db0d1e562083ef2541ae8b5435fa')

build() {
  cd mongomock
  python -m build --wheel --no-isolation
}

check() {
  cd mongomock

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  NO_LOCAL_MONGO=1 test-env/bin/python -m pytest -v tests \
    -k 'not (test__codec_options_with_pymongo or test__codec_options or test_insert_bson_invalid_encode_type or test_insert_bson_validation or test__bulk_write_ or test__get_collection_different_codec_options or test__with_options_pymongo or test__with_options_type_registry)'
}

package() {
  cd mongomock
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
