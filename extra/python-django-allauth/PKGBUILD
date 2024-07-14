# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.63.6
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://github.com/pennersr/django-allauth"
license=(MIT)
depends=(
  python
  python-asgiref  # implicitly provided via python-django
  python-cryptography  # implicitly provided via python-requests-oauthlib -> python-oauthlib
  python-django
  python-openid
  python-requests
  python-requests-oauthlib
  python-pyjwt
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pillow
  python-pytest
  python-pytest-django
  python-qrcode
  python-saml
)
optdepends=(
  'python-qrcode: for MFA support'
  'python-saml: for SAML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('4ca285cc8acf57575d7d7bba4a2dfbfc0076279d0dd7aa424d409cc70917494d847214907d83b89d9d10dd440b05c9e343ac091eb5d3ad5f81e85c2d602947d1')
b2sums=('07a3ba7546de6b5a7ebf731dd7fb11ba814042ffc81022d9211b685c5cfa3318a8966697fbbf2519be28272d8fa1f69ec1f141dba10b31886f8c98204c18ee78')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python manage.py test allauth
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
