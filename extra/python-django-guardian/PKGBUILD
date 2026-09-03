# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=3.4.0
pkgrel=1
pkgdesc="Per object permissions for Django"
arch=(any)
url="https://github.com/django-guardian/django-guardian"
license=(
  BSD-2-Clause
  CC-BY-4.0
)
depends=(
  python
  python-django
  python-django-environ
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('fa524a700cd086e07ce9e98ab5ac73c3f1e03337e53b7244439ac28deb25f80b376d1680e181826f65b38677f990c596bec9643167e17f7d8de449d47c37662c')
b2sums=('9e1de01b072db657129b896be30b556f94cb59d963839f74bf9a6e99a3cdace7fdd01e43c9f93dde2bc7995c516a7312adc13883b204ad50f2e783ae6c5a166e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {README,SECURITY}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
