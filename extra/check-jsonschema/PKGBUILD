# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=check-jsonschema
pkgver=0.33.2
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
sha512sums=('7e7c6caa37ce6a59ed01cdb8aa2672f872c1997d10e4e189207c34565ffa90862b18d9405dbe7725425ca6d4e5df83d87ab9a7bf78371e81b04e5a77133c0e72')
b2sums=('dc10d7f4d909032f9c998c60387f12b45718d6c3016f8dd099e54559a93455200af9a85afd5226cc62fd32e4cc3e0c566fcd418c580189e42513768a4dca0048')

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
