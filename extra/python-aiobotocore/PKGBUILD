# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
_pkgname=aiobotocore
# https://github.com/aio-libs/aiobotocore/releases
pkgver=2.17.0
pkgrel=1
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
# https://github.com/aio-libs/aiobotocore/blob/2.11.0/setup.py#L64
license=('Apache-2.0')
depends=(python python-aiohttp python-botocore python-wrapt python-aioitertools
         # detected by namcap but not listed in setup.py
         python-dateutil python-jmespath python-multidict python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-moto python-pytest python-pytest-asyncio python-dill python-docutils python-pip
              python-time-machine
              # moto optdepends
              python-docker python-openapi-spec-validator python-yaml python-flask python-flask-cors)
source=("git+https://github.com/aio-libs/aiobotocore.git#tag=$pkgver"
        "moto-5.x.diff")
sha256sums=('09711b66eb4e1eaa7ef1b3a6ca2a85db1f2f7ae4d8adc6a6ea21d5c68ac3f939'
            '2bfadc984a4ad3a6420b356d572c8085b82a46949fc0ecaea98ddce45980503b')

prepare() {
  cd $_pkgname
  # Work-around test failures with moto 5.x
  # See: https://github.com/aio-libs/aiobotocore/issues/1108
  patch -Np1 -i ../moto-5.x.diff
}

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
