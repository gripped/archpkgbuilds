# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.2.0
pkgrel=2
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
sha512sums=('1066bdcefcec544b6c91cec50e97dd142abc514cc1e748d66b37822cca9d6615d8c045fb1e8997ad4f8930a00ecd855ed74a6c7fd5cc73a4c1a61e5ec89c6d5c')
b2sums=('c3f2bbd4e2c8503770d7056b73e76e35c17b12dd272b4dac09605295fea01ae4ac57e139fd4054459cb86bdb4e8308a611201d9cfddd86def45a48301659554c')

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
