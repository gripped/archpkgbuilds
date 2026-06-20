# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-deepdiff
pkgver=8.6.2
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
sha512sums=('946e7376076a235083bbfc8364bdc8a54f224db3c14e2360884d8e3359290f3c00012a9147c86401db1c078bb508932db31c2e3e62c0d5e9d04d2a1fa528f0ac')

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
