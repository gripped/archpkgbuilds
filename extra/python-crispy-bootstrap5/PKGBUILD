# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-crispy-bootstrap5
_name="${pkgname#python-}"
pkgver=2026.3
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
sha512sums=('8cf01f4f21c6158b2d65e9911d92d848004b4de14e218fc5fb6483de647ed3537486755be5c802dc0b612d61279c2efbfdbd1335175903b6549eee1696ca2166')
b2sums=('bf22021761cc607a678daeff5fe567f69166dac452de7b345dc693ff049a31ed7224adda89d473c4b235a719ce9124ee38fa07663c40f93d774bcee39d8f9d34')

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
