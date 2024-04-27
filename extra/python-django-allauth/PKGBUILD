# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.62.0
pkgrel=2
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
sha512sums=('ee020f4e223a89eb5804b98e7cc4882e7325abe707be466d83ff6adbd6156e0300d911fd1020ca6af57ceb4d4b870bea126de5137b4f4cf332aac2db40347b26')
b2sums=('4737539ce8d996c3b1b4edc9bfb9a11c5361be3fabd48a379d49bd481a715e69a4851a6051767e1d4879604928a8c314dce67b167dd572822ad41f49ce4b0dd0')

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
  # remove tests dir: https://github.com/pennersr/django-allauth/issues/3752
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -frv "$pkgdir/$site_packages/tests"
}
