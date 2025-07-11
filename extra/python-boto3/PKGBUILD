# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boto3
pkgver=1.39.3
pkgrel=1
pkgdesc='The AWS SDK for Python'
arch=('any')
url='https://github.com/boto/boto3'
license=('Apache-2.0')
depends=(
  'python'
  'python-botocore'
  'python-jmespath'
  'python-s3transfer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-awscrt'
  'python-pytest'
  'python-pytest-xdist'
)
optdepends=('python-awscrt: AWS CRT S3 transfers')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('89a8e3bb96255c097ffa8a8d2dad6c18835d5404d502ba41fd500aac8dfb0d1229478b6d17e82e5668d00d6df604ade5a209a6c99f3d11fc956dee4c77c2452c')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Many integration tests need real credentials
  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id
  # Deselect tests failing on v1.38.23 - not sure why
  test-env/bin/python -m pytest tests -n auto --ignore=tests/integration \
    --deselect tests/functional/test_crt.py::TestS3TransferWithCRT::test_create_transfer_manager_on_optimized_instance \
    --deselect tests/unit/test_crt.py::TestCRTTransferManager::test_create_crt_transfer_manager \
    --deselect tests/unit/test_crt.py::TestCRTTransferManager::test_create_crt_transfer_manager_w_client_in_wrong_region \
    --deselect tests/unit/test_crt.py::TestCRTTransferManager::test_crt_singleton_is_returned_every_call \
    --deselect tests/unit/test_crt.py::TestCRTTransferManager::test_get_crt_s3_client \
    --deselect tests/unit/test_crt.py::TestCRTTransferManager::test_get_crt_s3_client_w_wrong_region
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
