# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mongomock
pkgver=4.1.0
pkgrel=1
pkgdesc="Fake pymongo stub for testing simple MongoDB-dependent code"
url="https://github.com/mongomock/mongomock"
license=('BSD-3-Clause')
arch=('any')
depends=('python-sentinels' 'python-packaging')
makedepends=('git' 'python-pbr' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pymongo' 'python-pytest')
source=("git+https://github.com/mongomock/mongomock.git#tag=$pkgver")
sha512sums=('35856201d4583ed532e6de1ba7e04251cd691b544ec2c092079034f4f1ac0256feb1217c0547b2b03f79e731931f2fb02991a72c6ae36e19f7b43002982e3765')

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
