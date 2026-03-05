# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=3.3.0
pkgrel=1
pkgdesc="Per object permissions for Django"
arch=(any)
url="https://github.com/django-guardian/django-guardian"
license=(
  BSD-2-Clause
  MIT
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
sha512sums=('025f30515ff1b1ae2d988edd7a9dbed3e567ed6dc798bdb228694bfa813d955a30df9f84856074eee6d041c25ae7db9a43c1c7d8b694f35ce61f21adcbc7c968')
b2sums=('cdfcc6504a8b9cd63969b51ed621714d8f70f7c82ca0f42dff0f94b473ca4fd39002376e9fb90a9d8b27a36c5cdfd43245b84f9f8f69faaea73518719a7147f8')

prepare() {
  sed -n '1,23p' $_name-$pkgver/LICENSE > BSD-2-Clause.txt
  sed -n '20,50p' $_name-$pkgver/LICENSE > MIT.txt
}

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
  install -vDm 644 ../*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
