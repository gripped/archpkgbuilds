# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crispy-bootstrap4
pkgname=python-crispy-bootstrap4
pkgver=2025.6
pkgrel=2
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
sha512sums=('10edf4d44931a593072c3089ec6eb82e1d42e37b4fcddbfa7c8313c868f880c9eff3d9b270f4bb31148285b9a88f9952348fe4485c76932300e2b788dd00cb91')
b2sums=('a239fba7c9d93d6455526d2dc577d6f1ce9bbe3d2ca5076d8376ad60bbaa1f56e7de103cd791ff9d16ffb4b81a4ff59a6fba8071f1098b1f1e10b7b7856cbb8b')

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
