# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.58.1
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://github.com/pennersr/django-allauth"
license=(MIT)
depends=(
  python
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
source=($_name-$pkgver.tar.gz::https://github.com/pennersr/$_name/archive/$pkgver.tar.gz)
sha512sums=('a8e78cd5d54f92ad7e2208aa7ed4cebd9a92cf61db105b04d654c5a95ef1598089d7030b12de247acb5d9604ed9f691cb5aafb2b715624362aae70834420e329')
b2sums=('1e2a4485eb6d80c99b9184c66d1eafbbf09ae8e7f2137636da51f54db168523ea7a76bdf7eb618e69702722d579695a3af52515f25d74befe53a7ebeb750dac9')

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
