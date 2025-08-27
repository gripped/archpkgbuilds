# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=3.0.6
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
sha512sums=('0d4241142fa1fdf30943af68d77bf1ff60f052e937a3fac249e2a0ae91b8449922d23c4a37453d76d2be3e4f40ae432cdb9b0cb653290febbbf2d0976c676233')
b2sums=('730c7a9f19a4816654c71715a8009024b233003509ecf0c7f2903331938b326d081540e0c90c028803d42183098650a8e81b714b533b5a3c0897cb035b4d4a71')

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
