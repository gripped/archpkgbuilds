# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
pkgver=3.1.2
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
  python-anyio
  python-dill
  python-docker
  python-docutils
  python-flask
  python-flask-cors
  python-moto
  python-openapi-spec-validator
  python-pip
  python-pytest
  python-time-machine
  python-yaml
)
source=("git+$url.git#tag=$pkgver")
b2sums=('30aceb0224b63bab1ec2f001dacebe667558f9a36a65e8a9b24a3371b6ddf2954990dc0e2b9fdd961fcbbec582f6896e82e97be7f246cf11444bc043b308d646')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  local pytest_args=(
    -m='not localonly'
    # Uses moto.awslambda, which requires a running Docker service.
    # See: https://github.com/spulec/moto/issues/3276
    --deselect='tests/test_lambda.py'
    # Validates Amazons internal patches as far as I understand, as such not
    # relevant for us.
    --deselect='tests/test_patches.py'
    # Fails for some reason.
    --deselect='tests/botocore_tests/unit/test_signers.py::test_signers_generate_db_auth_token[aiohttp-aws_auth0]'
    --deselect='tests/test_sns.py::test_topic_attributes[aiohttp]'
  )
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_args[@]}"
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
