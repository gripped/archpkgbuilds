# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
_pkgname=aiobotocore
# https://github.com/aio-libs/aiobotocore/releases
pkgver=2.21.1
pkgrel=1
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
# https://github.com/aio-libs/aiobotocore/blob/2.11.0/setup.py#L64
license=('Apache-2.0')
depends=(python python-aiohttp python-aioitertools python-botocore python-dateutil
         python-jmespath python-multidict python-wrapt)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-moto python-pytest python-pytest-asyncio python-dill python-docutils python-pip
              python-time-machine
              # moto optdepends
              python-docker python-openapi-spec-validator python-yaml python-flask python-flask-cors)
source=("git+https://github.com/aio-libs/aiobotocore.git#tag=$pkgver")
sha256sums=('2ea768545e01d39c9a35e5a657b79895f0b2e4f2cfc5d776db2167cc42ba5f24')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  export PYTHONPATH="$PWD"
  # test_lambda uses moto.awslambda, which requires a running Docker service
  # See: https://github.com/spulec/moto/issues/3276
  pytest -m "not localonly" tests \
      --ignore=tests/test_lambda.py
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
