# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
_pkgname=serverless-application-model
pkgver=1.103.0
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
  # python-yaml is needed by samtranslator.yaml_helper, while the latter is
  # used in tests only
  python-yaml
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ce053419fe99391959ca54d972cdfe021f70dea54c10aae3b8d992463da6616c')

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
  cd $_pkgname-$pkgver
  AWS_DEFAULT_REGION=us-east-1 PYTHONPATH="$PWD" pytest tests \
    -n auto --override-ini="addopts="
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
