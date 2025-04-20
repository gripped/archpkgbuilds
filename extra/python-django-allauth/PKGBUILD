# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.7.0
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://codeberg.org/allauth/django-allauth"
license=(MIT)
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
sha512sums=('6e460779e1227bd127bd05a215c220ebecd74addc8e87f207fd3ee781c8339a7dfcd239649f4c0b1087dd7bd5fbb14da66dbf1a33bc0c8c520423c577b2aa711')
b2sums=('4744857c22aa44470d70288d6e7d7168742d04bfccbc393ef8991d1c26d5765a2af54ff813bb34e99a10c163c5cce2453e5cf84afc8b01ef8e10ea61912cb4d5')

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
