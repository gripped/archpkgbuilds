# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-crispy-bootstrap5
_name="${pkgname#python-}"
pkgver=2025.4
pkgrel=1
pkgdesc="Bootstrap5 template pack for django-crispy-forms"
arch=(any)
url="https://github.com/django-crispy-forms/crispy-bootstrap5"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-django
  python-django-crispy-forms
  python-pytest
  python-pytest-django
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('971ead38d3430284aa7665bca558ebd4ff5d29f4a979ab7e04736bab4c4d3a4c4c7ff8d25265ec9f2dcfd264d99cae497674e0ef32f284896d99660c93e5ac78')
b2sums=('d17c409c0c7d8797c92499d6198d92b051d5251fcd36bc77e77d32da71e679c650128012fd3b2e86575c66994365d828ac39610f6100e6853cdf8f5be278ccee')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PWD:$PYTHONPATH"
  pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
