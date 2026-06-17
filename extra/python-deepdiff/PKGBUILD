# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-deepdiff
pkgver=8.6.0
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
makedepends=('python-build' 'python-flit-core' 'python-installer' 'git')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-clevercsv' 'python-click' 'python-dateutil'
              'python-jsonpickle' 'python-numpy' 'python-tomli-w' 'python-yaml' 'python-orjson'
              'python-pydantic' 'python-pandas' 'python-polars' 'python-uuid6')
source=("git+https://github.com/seperman/deepdiff.git#tag=$pkgver")
sha512sums=('c2572a6a6d6ae6817c652122e7e13b5116abd237bf4a7f1bfd36ed4b1f59196d42e4153843823d3b0b8bcc38689038f3c84066c5e83eaf3296e54ef007bd783a')

prepare() {
  cd deepdiff
  sed -i 's/flit_core >=3.11,<4/flit_core/' pyproject.toml
}

build() {
  cd deepdiff
  python -m build --wheel --no-isolation
}

check() {
  cd deepdiff
  pytest
}

package() {
  cd deepdiff
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
