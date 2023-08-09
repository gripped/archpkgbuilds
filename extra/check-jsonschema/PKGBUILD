# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.24.0
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache)
depends=(
  python
  python-click
  python-jsonschema
  python-requests
  python-ruamel-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-json5
  python-pytest
  python-pytest-xdist
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
)
source=(
  # no tests in sdist tarballs
  # https://github.com/python-jsonschema/check-jsonschema/issues/258
  # https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
  $url/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('fe6ecec27983837c73300b9339320ea98f623887cd0644a2bce800a1617877856bb92a4c14c10d8eb1bff522b6d18ad1918f1e4b5853f1bb5ea3c027daf8bc24')
b2sums=('4e05329e724a3eedf0d2ad4989fbeb74ce4f195abcfadb904781f6cda7bd0fa4f5d32e934556b316e304743322edf74fa0d30c3c6f186eac0981376e3d8064fb')

check() {
  # we don't support pinning
  sed -e 's/==/>=/g' -i $pkgname-$pkgver/setup.cfg
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
