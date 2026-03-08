# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-path
# https://github.com/p1c2u/jsonschema-path/releases
pkgver=0.4.0
pkgrel=1
pkgdesc="JSONSchema Spec with object-oriented paths"
url="https://github.com/p1c2u/jsonschema-path"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-pathable' 'python-yaml' 'python-requests' 'python-referencing')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-responses')
source=("git+https://github.com/p1c2u/jsonschema-path.git#tag=$pkgver")
sha512sums=('6f346bdc665cb25f40f2748bb6d40ab9298b6b3adff1e927fc6d2e8cf3e3d903cac700eeb544eb4026c5d5bbf3f8016a86abf8350798dfbd233a897cbf3c8c57')

prepare() {
  cd jsonschema-path
  sed -i '/--cov/d' pyproject.toml
  # Allow newer referencing versions
  sed -i 's/referencing = "<0.37.0"/referencing = ">=0.28.0"/' pyproject.toml
}

build() {
  cd jsonschema-path
  python -m build -wn
}

check() {
  cd jsonschema-path
  PYTHONPATH="$PWD" pytest
}

package() {
  cd jsonschema-path
  python -m installer -d "$pkgdir" dist/*.whl
}
