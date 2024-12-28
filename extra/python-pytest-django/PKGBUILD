# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-django
pkgver=4.9.0
_commit=49b98d184e89ea68da0ee14e1ddb3fd4dbb72ddd
pkgrel=1
pkgdesc="A Django plugin for py.test"
arch=('any')
license=('BSD')
url="https://github.com/pytest-dev/pytest-django"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-django' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-django.git#commit=$_commit")
sha512sums=('3f01d3aab89862a453c6faa8e5d0523a393b16b97915ea42c96f980b4e83a25ab853ba6c1cd5e2856788506d7c05e441b692135691bfd5993930357a98d4b2ae')

build() {
  cd pytest-django
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-django
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH:$PWD" \
  DJANGO_SETTINGS_MODULE=pytest_django_test.settings_sqlite \
    pytest tests
}

package() {
  cd pytest-django
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm664 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
