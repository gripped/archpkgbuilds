# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-crispy-forms
pkgname=python-django-crispy-forms
pkgver=2.5
pkgrel=3
pkgdesc="The best way to have DRY Django forms"
arch=(any)
url="https://github.com/django-crispy-forms/django-crispy-forms"
license=(MIT)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-crispy-bootstrap3
  python-crispy-bootstrap4
  python-crispy-bootstrap5
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-crispy-bootstrap3: for a bootstrap 3 theme pack'
  'python-crispy-bootstrap4: for a bootstrap 4 theme pack'
  'python-crispy-bootstrap5: for a bootstrap 5 theme pack'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('ec1d6cd0de828aceb00a5f9a1f09ceac69e4ad67a16c8e4cdd7f8e5a6f0e5be6f954bb22ed6741bb259b69be04d76e0bf1dfc16ea0a4b454eec674dfc93f05b5')
b2sums=('233c9cde2cbda2e902de07cb6e6c2ea580860501875f2993e00afba66e4e08381b7fa787a127fea1d7212cab9a0d6faff1d6ccdfdbfb23777788e1fbb49c5926')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PWD:$PYTHONPATH"
  DJANGO_SETTINGS_MODULE=tests.test_settings pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CONTRIBUTORS.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
