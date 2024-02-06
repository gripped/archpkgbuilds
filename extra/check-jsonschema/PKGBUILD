# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.28.0
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache-2.0)
depends=(
  python
  python-click
  python-importlib-resources
  python-jsonschema
  python-referencing
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
  python-regress
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('cb3ed8039558c42349b51b88c03b38d7b73c20cdcae927b71731a0d0f60ddde916034ccdc901a159f7b92d9363e904e8eadc3d0db2e3b306e202414ad335ab43')
b2sums=('5a34bee9245fb0360fbcb12401389d64280c97b20ca11c3ab080d264ebdd721474a05363c1d170a4e58df5f509be301e11f0df1da484a6db057dffa82f4ede85')

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
