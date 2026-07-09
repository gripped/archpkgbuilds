# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=check-jsonschema
pkgver=0.37.4
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
sha512sums=('d3b067eaf8c81a4539d0f8ca6f0909f94c5e90808eab0d8570c6531223a15472324b634003980b1a3abde3b391c4842fa1adb033155593adeb6c926be011aa25')
b2sums=('4f8dd8c28a675c8f9bff84881682fb6c587077dc1daf0a8f331b4e43e3ff201a230df4d2491cfa98668591e1223873e6eeb2d199482ddf48bf3deb11699c986e')

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
