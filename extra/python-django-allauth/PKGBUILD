# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.9.0
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://codeberg.org/allauth/django-allauth"
license=(MIT)
# NOTE: Upstream seems to be of the opinion that indirectly depending on a set of libraries is just fine.
# So we have a growing list of false-positive dependencies that we are not supposed to add as direct dependencies...
# python-django-rest-framework: https://codeberg.org/allauth/django-allauth/issues/4431
# python-django-ninja: https://codeberg.org/allauth/django-allauth/issues/4432
depends=(
  python
  python-asgiref
  python-django
  python-pyyaml  # implicitly required but not specified
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-django-ninja
  python-django-rest-framework
  python-fido2
  python-openid
  python-pillow
  python-pytest
  python-pytest-asyncio
  python-pytest-django
  python-pyjwt
  python-psycopg2
  python-qrcode
  python-requests
  python-requests-oauthlib
  python-saml
)
optdepends=(
  'python-cryptography: for social account support'
  'python-fido2: for MFA support'
  'python-openid: for OpenID and Steam support'
  'python-pyjwt: for social account support'
  'python-qrcode: for MFA support'
  'python-requests: for social account support'
  'python-requests-oauthlib: for social account support'
  'python-saml: for SAML support'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('3b9161137f1ce512408efa86a544c712adf6d5705705690f5b4f31f9d2b4bfb9b3633fd3b058d4f3be550830104a11622d30019ae2dab61051275dc7a5d464ea')
b2sums=('a914f73d1a6fec25bab212ce4a9ce9f1de1345620cbdcd643b22cedff2e9d855c40c19f91f6e8eea3b5b52fd14dd5b099fe58b9e147a0c1cf5c30d254db3455d')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
