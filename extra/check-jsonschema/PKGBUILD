# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.28.2
pkgrel=2
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
sha512sums=('dcfcddf26e7d54803bc7d3192b56681ded58286daf9d9d71f29a1f70e909ad3de5b9a2c63479a647359729eaec7173b7cd7c20030d778f2192d21ba66c75250f')
b2sums=('33f22d622af89a76c07f7fe77caad23d4c3f5649cfe09a0af479a7d5a942baf29f216369b906a7c519c2c56e7d15404666ca0e53eab643032a1584e752ee5b1e')

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
