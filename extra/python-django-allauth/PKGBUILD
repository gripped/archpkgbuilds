# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.0.2
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://codeberg.org/allauth/django-allauth"
license=(MIT)
depends=(
  python
  python-asgiref  # implicitly provided via python-django
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-fido2
  python-openid
  python-pillow
  python-pytest
  python-pytest-asyncio
  python-pytest-django
  python-pyjwt
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
sha512sums=('9355a170c2eaec14262596714c9b2a5aaec97f4f4835a6c2157e23e7ae0f9c99bb34b8cb3e8ad4887c90725f9bd66efdf800eb5c0ecb0fcd1a3ee1a3690f9f49')
b2sums=('0a74118b49cb2b471a3eddb9d43095d52287738cd6d715ab9ec80b702611c7650d8a1e601c49b71aae67ed27725e0aa4da5d4deda0053fdc6f5b2e9ec31ff07c')

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
