# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.12.0
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
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-cryptography
  python-django-ninja
  python-django-rest-framework
  python-fido2
  python-oauthlib
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
  'python-oauthlib: for OIDC IdP support'
  'python-pyjwt: for social account and OIDC IdP support'
  'python-qrcode: for MFA support'
  'python-requests: for social account support'
  'python-requests-oauthlib: for social account support'
  'python-saml: for SAML support'
)
source=("$pkgname::git+https://codeberg.org/allauth/django-allauth.git#tag=${pkgver}")
sha512sums=('695595894b82abe9a7ddd3a91779dc577533dfa72def064a555876c330ebd163b9a7d37dbb24a2a32034f33da4826335dc6559a607fdbd39411bf777d33bcb26')
b2sums=('29e8638c4a2b95017237a49f75229b62900cc9faed2a912182b12334a0c4f30907ea13337767d32050fc68752374a0e9de28cb4cdb7d61b293b4133c62e9768f')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  pytest -vv
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
