# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mongomock
pkgver=4.1.3
pkgrel=1
pkgdesc="Fake pymongo stub for testing simple MongoDB-dependent code"
url="https://github.com/mongomock/mongomock"
license=('BSD-3-Clause')
arch=('any')
depends=('python-sentinels' 'python-packaging' 'python-pytz')
makedepends=('git' 'python-pbr' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pymongo' 'python-pytest')
source=("git+https://github.com/mongomock/mongomock.git#tag=$pkgver")
sha512sums=('a98566ee7b8566f73362d3856359f576f0af8cc835947c082cdc49ee9e6ac132f75226e49f8b4d628a480c31ba30a6878d36f90eef88a66a59cb68f3bd3d9410')

build() {
  cd mongomock
  python -m build --wheel --no-isolation
}

check() {
  cd mongomock
  NO_LOCAL_MONGO=1 PYTHONPATH="$PWD" pytest -v tests \
    -k 'not (test__codec_options_with_pymongo or test__codec_options or test_insert_bson_invalid_encode_type or test_insert_bson_validation or test__bulk_write_ or test__get_collection_different_codec_options or test__with_options_pymongo or test__with_options_type_registry)'
}

package() {
  cd mongomock
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
