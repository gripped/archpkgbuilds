# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
_pkgname=aiobotocore
# https://github.com/aio-libs/aiobotocore/releases
pkgver=2.11.2
pkgrel=2
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
# https://github.com/aio-libs/aiobotocore/blob/2.11.0/setup.py#L64
license=('Apache-2.0')
depends=(python python-aiohttp python-botocore python-wrapt python-aioitertools
         # detected by namcap but not listed in setup.py
         python-dateutil python-jmespath python-multidict python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-moto python-pytest python-pytest-asyncio python-dill python-docutils python-pip
              # moto optdepends
              python-docker python-openapi-spec-validator python-yaml python-flask python-flask-cors)
source=("https://github.com/aio-libs/aiobotocore/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1af0e2099a2458373221cace8ff4684ea520d3897c898703bb653be9b9306a9d')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  export PYTHONPATH="$PWD"
  # test_lambda uses moto.awslambda, which requires a running Docker service
  # See: https://github.com/spulec/moto/issues/3276
  pytest -m moto tests \
      --ignore=tests/test_lambda.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
