# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boto3
pkgver=1.35.23
pkgrel=1
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
sha512sums=('ccd5c2654f5f355a77fa0b562e5e1603948ae2146b2600a01e17fac2540deb86adcc82d3d5c493385361f0473820c7b7eaf7057566cd33ca50e7f18b8f8e6579')

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
