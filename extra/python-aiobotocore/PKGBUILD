# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
pkgver=2.22.0
pkgrel=1
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
license=('Apache-2.0')
depends=(
  python
  python-aiohttp
  python-aioitertools
  python-botocore
  python-dateutil
  python-jmespath
  python-multidict
  python-wrapt
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-dill
  python-docker
  python-docutils
  python-flask
  python-flask-cors
  python-moto
  python-openapi-spec-validator
  python-pip
  python-pytest
  python-pytest-asyncio
  python-time-machine
  python-yaml
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('df7ff2ded659e8000ef2fca289d484ac29a58afbc33c405b030f285b4b1d66a8')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  local pytest_args=(
    -m='not localonly'

    # test_lambda uses moto.awslambda, which requires a running Docker service
    # See: https://github.com/spulec/moto/issues/3276
    --ignore=tests/test_lambda.py

    # Fails for some reason
    --deselect='tests/test_patches.py::test_patches[BaseClient._make_api_call-digests12]'
    --deselect='tests/test_patches.py::test_patches[Config-digests21]'
    --deselect='tests/test_patches.py::test_patches[EndpointRulesetResolver._get_provider_params-digests117]'
    --deselect='tests/test_patches.py::test_patches[Session.create_client-digests123]'
    --deselect='tests/test_patches.py::test_patches[Waiter.wait-digests191]'
  )
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_args[@]}"
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
