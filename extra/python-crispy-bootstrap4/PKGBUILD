# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crispy-bootstrap4
pkgname=python-crispy-bootstrap4
pkgver=2024.10
pkgrel=3
pkgdesc="Bootstrap4 template pack for django-crispy-forms"
arch=(any)
url="https://github.com/django-crispy-forms/crispy-bootstrap4"
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
sha512sums=('4cd7cde7d987baa5f6806076fe7f991e450544427deee9b0e64a45acd94b2987352369a6d277b90e6c9ff19e35225a3b5bc219336725b67e4aa0c8280cd6ac12')
b2sums=('8104bc4964fa11df05a6b6e244e4c58cc678225afdedf4a72749cc74986d8b763c6fe32aba9376d2a4077ac765c06df4582fa796caee885e82156c81369dcf16')

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
