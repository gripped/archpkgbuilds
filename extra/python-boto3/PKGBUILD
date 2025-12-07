# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boto3
pkgver=1.42.4
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
sha512sums=('95950ba80f31c3951a88237ff5edd1367285c3ab263c7f8ad1b7556d610d553dd4e2021fbbcc0d9bdcf578fe34ad9fcf6231511f54ee71917f69c1cdb6adab28')

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
    --deselect=tests/functional/test_crt.py::TestS3TransferWithCRT::test_create_transfer_manager_on_optimized_instance \
    --deselect=tests/functional/test_crt.py::TestS3TransferWithCRT::test_create_transfer_manager_with_crt_preferred \
    --deselect=tests/unit/test_crt.py::TestCRTTransferManager::test_create_crt_transfer_manager \
    --deselect=tests/unit/test_crt.py::TestCRTTransferManager::test_create_crt_transfer_manager_w_client_in_wrong_region \
    --deselect=tests/unit/test_crt.py::TestCRTTransferManager::test_crt_singleton_is_returned_every_call \
    --deselect=tests/unit/test_crt.py::TestCRTTransferManager::test_get_crt_s3_client \
    --deselect=tests/unit/test_crt.py::TestCRTTransferManager::test_get_crt_s3_client_w_wrong_region
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
