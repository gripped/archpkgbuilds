# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-crispy-forms
pkgname=python-django-crispy-forms
pkgver=2.2
pkgrel=1
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
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-crispy-bootstrap3: for a bootstrap 3 theme pack'
  'python-crispy-bootstrap4: for a bootstrap 4 theme pack'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('a379fbd1b9916aa3123a4c1af5c9da4916573c57b2e575cb189fe8cba23718490c9130ff55e7ae80dbb3d9476d449daf1f8c9f8caec80f394601af6246615f24')
b2sums=('bb80affa2050c1eee3bb706ab5fc48555676cf118b78ff4d28031c1df9c0e8adba9f1638cbea7f87c4edd2d655fb1a00de30b64e073b1f0f9b35a6103d9b9c08')

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
