# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-crispy-forms
pkgname=python-django-crispy-forms
pkgver=2.6
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
sha512sums=('cab9b9dc0c607210635578fe6390419aab0ac98357f08f3941bc0c4d129e7c4784bdc02eb1a4cfe754b4b30eae59ed3293f493584447c777b62d07fb03a74ea5')
b2sums=('89fac9fe846989f8060996a43584f3c1ffe99025b89a17d72f3ec4dc69226ff35f1f9c4e1d953ba03d4a1fe4ede7bd264bcdd6a7604d4e75b0a64fafd7954bfa')

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
