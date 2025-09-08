# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=3.1.2
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
sha512sums=('2f893d3d3de94daaca6021ec8e47294378c3230e95326e25f4ab48c565778e49c270b035f1dbfff6e03351952f0b59f60f7b320220c64176ecfd656ad2092a66')
b2sums=('c3ec3eb8f9b72915ead9ed09c656876fceef369aece4e0d7a4fc43b83e6d52d587c6b1af29ed628b94cd2c65c85990c44fa824a0e3b60b255b5f86f8a2924b35')

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
