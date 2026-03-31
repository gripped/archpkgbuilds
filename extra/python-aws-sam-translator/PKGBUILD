# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
_pkgname=serverless-application-model
pkgver=1.108.0
pkgrel=1
pkgdesc='AWS Serverless Application Model (AWS SAM) prescribes rules for expressing Serverless applications on AWS'
arch=(any)
url='https://github.com/aws/serverless-application-model'
license=('Apache-2.0')
depends=(
  python
  python-boto3
  python-botocore
  python-jsonschema
  python-pydantic
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-parameterized
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
  python-requests
  # python-yaml is needed by samtranslator.yaml_helper, while the latter is
  # used in tests only
  python-yaml
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5f894121d28c0f4a9eb97a5412f85e5df3f379bd6a69ea236a47ec7654b84a9c4dcc88607887ac1586cf6a114c94f23abf46c50bfae62d587ec0a7f5861dc6e7')

prepare() {
  cd $_pkgname-$pkgver
  # Avoid very verbose testing logs
  sed -i -r 's#log_cli\s*=\s*1#log_cli = 0#' pytest.ini
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::UserWarning
    -n auto
    --override-ini="addopts="
  )
  cd $_pkgname-$pkgver
  AWS_DEFAULT_REGION=us-east-1 PYTHONPATH="$PWD" pytest "${pytest_options[@]}" tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
