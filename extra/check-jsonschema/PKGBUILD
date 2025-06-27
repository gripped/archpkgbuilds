# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=check-jsonschema
pkgver=0.33.1
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache-2.0)
depends=(
  python
  python-click
  python-jsonschema
  python-referencing  # implicitly pulled in via python-jsonschema
  python-regress
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
  python-identify
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
sha512sums=('60d7f38a0e6c3cfa734e48af2139531658d7e4101289e9cca82b52d45fb4c439b4d36e75b8e399e2762635736987885e6b3b95205ca74d23973b1b12a58ebed6')
b2sums=('ff72d10e41754daafc61b85a94e3fd7cc0b5f23176765169b1ef9938b2242a989e4bf17fc9b4d918e92f8656c729b8f9c02030ee89b84925fce1a16159cf8b3b')

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
