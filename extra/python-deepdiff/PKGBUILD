# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-deepdiff
pkgver=8.2.0
pkgrel=1
pkgdesc="Deep Difference and Search of any Python object/data."
url="https://github.com/seperman/deepdiff"
license=('MIT')
arch=('any')
depends=('python-orderly-set')
optdepends=('python-click: for cli'
            'python-tomli-w: for TOML support'
            'python-yaml: for YAML support'
            'python-clevercsv: for more robust CSV parsing'
            'python-orjson: for speed and memory optimized parsing')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-clevercsv' 'python-click' 'python-dateutil'
              'python-jsonpickle' 'python-numpy' 'python-tomli-w' 'python-yaml' 'python-orjson'
	      'python-pydantic' 'python-pandas' 'python-polars')
source=("git+https://github.com/seperman/deepdiff.git#tag=$pkgver")
sha512sums=('85647abf06fe74ac93db4a4866c26409f9ae9b4aa6b948ff2a91a1cc31f883e7df35ae15d95288cf9d46002882cf447b12dc6caa0c2137bbc3cdcd26d3b4456f')

build() {
  cd deepdiff
  python -m build --wheel --no-isolation
}

check() {
  cd deepdiff
  # json.decoder.JSONDecodeError: Illegal trailing comma before end of object: line 3 column 21 (char 45)
  pytest tests \
    --deselect "tests/test_command.py::TestCommands::test_diff_command[t1_corrupt.json-t2.json-Expecting property name enclosed in double quotes-1]" \
    --deselect "tests/test_delta.py::TestBasicsOfDelta::test_simple_set_elem_value"
}

package() {
  cd deepdiff
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
