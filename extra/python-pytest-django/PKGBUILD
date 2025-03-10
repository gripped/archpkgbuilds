# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-django
pkgver=4.10.0
pkgrel=1
pkgdesc="A Django plugin for py.test"
arch=('any')
license=('BSD')
url="https://github.com/pytest-dev/pytest-django"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-django' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-django.git#tag=v$pkgver")
sha512sums=('d13bc81867a575bd0cbfc40a8c0ad150f273401dabaddba3723f60237ef4bdc3cf59b7e2abd511e456b6e37788602d5f573b184d5e468d02a021172800cc8c7a')

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
