# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.28.1
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
  python-referencing  # implicitly pulled in via python-jsonschema
  python-regress
  python-requests
  python-ruamel-yaml
  python-typing_extensions  # implicitly pulled in via python-jsonschema
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-json5
  python-orjson
  python-pytest
  python-pytest-xdist
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
  'python-orjson: for using orjson as JSON parser'
)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('bf9189e362060a2e2fe98859482f85af32bfb4b29b8f4ec9a0e51f6c47096ab7b18b104a4bd619e65e19926e6746d4d35a90bda57890973e9209fbbdf1c3ca5c')
b2sums=('0d080315ea960ea22deb7190757b0ff10a0fb5d4d804f84ac3738d6c6e955c0b423179b9bd50f97a9e21d906495b837549f75294fd6fc47fce951f005273cc4f')

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
