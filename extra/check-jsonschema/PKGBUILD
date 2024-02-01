# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.27.4
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
sha512sums=('1b08b291ae758ed7edfbc83761142f6f824759c57692e907260c9873046b655abb5db1f5e6678834efdd28f629d7e7dd338d5f9d89b65da67c2b1b597f37c64b')
b2sums=('67d7075e40e27228169a5cfeb812952becf9dd049b703210aeead38292a3cb7f1d13aedda35de55d0e50251869a7be292ec745a1c2364ebf1068401264532df0')

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
