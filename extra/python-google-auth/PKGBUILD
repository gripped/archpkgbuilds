# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=google-auth
pkgname=python-google-auth
pkgver=2.57.0
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
sha512sums=('136985c69ad2846cd7a36e50f8c33e1a46a66cfb5536bbebbb9c11457dd706586dc4738970effaaae37d5f983a3e753886a96e9a38e12d8bdaa2ed32422ebf71')

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
