# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=google-auth-library-python
pkgname=python-google-auth
pkgver=2.48.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python"
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
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "python-pyopenssl-compatibility.patch"
)
sha512sums=('67f010fc05cbf5db25312b0fcc5de59edf1cfc9387609dcf3d34b65508d28f1bc5a760a169c532f5c9f1c3f0bb14dd67807675c7c8a9c5ba2c7e89b1850919de'
            '4e23dfaeec6933b1fb6736b6402f1f3cce0fedc0967e527879bc1b3e6215d94c986c28ab9d6b9b4ba975f39316eb0159bb74144aca1f27345b0a9174857fcfff')

prepare() {
  cd $_name-$pkgver

  patch -Np1 -i ../python-pyopenssl-compatibility.patch

  # Remove python-mock, upstream PR: https://github.com/googleapis/google-auth-library-python/pull/1361
  sed -i -e 's/^import mock$/from unittest import mock/' \
         -e 's/^from mock import /from unittest.mock import /' \
    system_tests/*.py system_tests/*/*.py \
    tests/*.py tests/*/*.py \
    tests_async/*.py tests_async/*/*.py \
    tests/transport/aio/*.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m pytest tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
