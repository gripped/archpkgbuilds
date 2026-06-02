# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=google-auth
pkgname=python-google-auth
pkgver=2.53.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/googleapis/google-cloud-python"
license=('Apache-2.0')
arch=('any')
depends=(
  'python'
  'python-cachetools'
  'python-certifi'  # somehow implicitly required in google/auth/transport/urllib3.py
  'python-cgi'  # somehow implicitly required in google/auth/_oauth2client.py
  'python-oauth2client'  # somehow implicitly required in google/auth/_oauth2client.py
  'python-packaging'  # somehow implicitly required in google/auth/transport/urllib3.py
  'python-pyasn1-modules'
  'python-rsa'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-aiohttp'
  'python-aioresponses'
  'python-cryptography'
  'python-flask'
  'python-freezegun'
  'python-pyjwt'
  'python-pyopenssl'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-localserver'
  'python-pyu2f'
  'python-requests'
  'python-requests-mock'
  'python-responses'
)
optdepends=(
  'python-aiohttp: for async HTTP support'
  'python-cryptography: for TLS support'
  'python-pyjwt: for JSON Web Key support'
  'python-pyopenssl: for TLS support'
  'python-pyu2f: for reauthentication support'
  'python-requests: for async HTTP support'
)
source=(
  "${url}/archive/refs/tags/${_name}-v${pkgver}.tar.gz"
  "python-pyopenssl-compatibility.patch"
)
sha512sums=('0b1c9204c6abc058bfb7f01613d1cac4e8ff8787f1332d6fd2d5d2358af0ea06328d7683ad1b240f6665b6e26f3066232ed401febcb879cd25ac15f33612fc64'
            '4e23dfaeec6933b1fb6736b6402f1f3cce0fedc0967e527879bc1b3e6215d94c986c28ab9d6b9b4ba975f39316eb0159bb74144aca1f27345b0a9174857fcfff')

prepare() {
  cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"

  patch -Np1 -i "$srcdir"/python-pyopenssl-compatibility.patch

  # Remove python-mock, upstream PR: https://github.com/googleapis/google-auth-library-python/pull/1361
  sed -i -e 's/^import mock$/from unittest import mock/' \
         -e 's/^from mock import /from unittest.mock import /' \
    system_tests/*.py system_tests/*/*.py \
    tests/*.py tests/*/*.py \
    tests_async/*.py tests_async/*/*.py \
    tests/transport/aio/*.py
}

build() {
  cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
  python -m build --wheel --no-isolation
}

check() {
  cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
  python -m pytest tests
}

package() {
  cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
