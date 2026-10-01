# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=google-auth
pkgname=python-google-auth
pkgver=2.59.1
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
sha512sums=('9c53edac22712c37564f17deec1830c8155315d4f33fd23d5e2cb97bb7a5f54f95a44a04a2811a4b0ffb57c4e8cdcb5d67288c3f49935118d58b2f3f027ad96d')

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
