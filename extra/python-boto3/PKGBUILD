# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boto3
pkgver=1.33.1
pkgrel=2
pkgdesc='The AWS SDK for Python'
arch=('any')
license=('Apache')
url='https://github.com/boto/boto3'
depends=('python' 'python-botocore' 'python-jmespath' 'python-s3transfer')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-awscrt')
optdepends=(
  'python-awscrt: AWS CRT S3 transfers'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/boto/boto3/archive/$pkgver.tar.gz")
sha512sums=('95996e4005d33e85de8f15889e69c4725943b5a0dd74ee97ae82c282b9da68cdbfcbd494b66c4adca5b530eefbe5505b963f9fcb9e97bd78bc74525c78708818')

build() {
  cd boto3-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd boto3-$pkgver

  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  export PYTEST_XDIST_AUTO_NUM_WORKERS=$(echo "$MAKEFLAGS" | grep -oP '\-j\s*\K[0-9]+')
  pytest_args=()
  if [ -n "$PYTEST_XDIST_AUTO_NUM_WORKERS" ]; then
    pytest_args+=(-n auto)
  fi

  # Many integration tests need real credentials
  pytest tests "${pytest_args[@]}" --ignore=tests/integration
}

package() {
  cd boto3-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
