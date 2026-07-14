# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=google-auth
pkgname=python-google-auth
pkgver=2.56.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/googleapis/google-cloud-python"
license=('Apache-2.0')
arch=('any')
depends=(
  'python'
  'python-cryptography'
  'python-pyasn1-modules'
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
  'python-flask'
  'python-freezegun'
  'python-grpcio'
  'python-pyjwt'
  'python-pyopenssl'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-localserver'
  'python-pyu2f'
  'python-requests'
  'python-responses'
  'python-urllib3'
)
optdepends=(
  'python-aiohttp: for async HTTP support'
  'python-packaging: for HTTP support'
  'python-pyjwt: for JSON Web Key support'
  'python-pyopenssl: for TLS support'
  'python-pyu2f: for reauthentication support'
  'python-requests: for async HTTP support'
  'python-rsa: for RSA support'
  'python-urllib3: for HTTP support'
)
source=("${url}/archive/refs/tags/${_name}-v${pkgver}.tar.gz")
sha512sums=('969ac6ba6faa08b8d8da0bd1b84da2f121af136ef0f12663bf2581d816cd0e94c0be0229ccd85b33a0d98a038d420986092c15b6a7ced427d024319d722a4f46')

build() {
  	cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
  	python -m build --wheel --no-isolation
}

check() {
	cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"

	# TODO: Re-enable all tests once compatibility with aiohttp has been restored.
	python -m pytest tests \
		--deselect tests/transport/aio/test_aiohttp.py::TestRequest::test_request_clone_with_active_session
}

package() {
	cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
