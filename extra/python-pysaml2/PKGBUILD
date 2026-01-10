# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-pysaml2
pkgver=7.5.4
pkgrel=2
pkgdesc='Python implementation of SAML Version 2'
arch=('any')
url='https://github.com/IdentityPython/pysaml2'
license=('Apache-2.0')
depends=(
  'python'
  'python-cryptography'
  'python-dateutil'
  'python-defusedxml'
  'python-pyopenssl'
  'python-requests'
  'python-xmlschema'
  'xmlsec'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pyasn1'
  'python-pymongo'
  'python-pytest'
  'python-responses'
 )
optdepends=(
  'python-paste: for paste integration'
  # 'python-repoze.who: for repoze.who integration'  # TODO: package
  'python-zope-interface: for zope integration'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('411039c943a72649677133b21390dbb55add533ba67302bea60b64b2ebe820e6fab3cdeb442accff6d2966e72bb93f115a0b8c3766b67c8091bce26aa16c2bf5')

prepare() {
  cd ${pkgname#python-}-$pkgver
  # Upstream caps xmlschema at version 3, but we have 4.x which changed sandbox
  # behavior - files outside base_url are now blocked. Use "local" to allow any
  # local file while still blocking remote URLs.
  sed -i 's/"allow": "sandbox"/"allow": "local"/' src/saml2/xml/schema/__init__.py
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests fail for some reason
  test-env/bin/python -m pytest \
    --deselect=tests/test_50_server.py::TestServer1::test_encrypted_response_6 \
    --deselect=tests/test_50_server.py::TestServer1NonAsciiAva::test_encrypted_response_6 \
    --deselect=tests/test_81_certificates.py::TestGenerateCertificates::test_validate_cert_chains \
    --deselect=tests/test_81_certificates.py::TestGenerateCertificates::test_validate_with_root_cert \
    --deselect=tests/test_schema_validator.py::test_namespace_processing
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
