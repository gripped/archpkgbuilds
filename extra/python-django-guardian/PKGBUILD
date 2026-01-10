# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-guardian
_name="${pkgname#python-}"
pkgver=3.2.0
pkgrel=2
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
sha512sums=('3eb7a7c7a4d1bd24887078c74374d7fabb28953b8f17beb0a53676fe79ecad265bd90f3777c4031b5103c952f6c7b153220dcb39771f671eb07f4a683508462d')
b2sums=('d8dca36942b9714263c7bb925df4ba58bbc55ad6556dad94d856d1f09aac56bfe061fa95047d23ecc2963e482c446c2ae42685c64f4f71f2ec988c9c45fdc933')

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
