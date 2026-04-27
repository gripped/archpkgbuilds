# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-path
# https://github.com/p1c2u/jsonschema-path/releases
pkgver=0.4.6
pkgrel=1
pkgdesc="JSONSchema Spec with object-oriented paths"
url="https://github.com/p1c2u/jsonschema-path"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-pathable' 'python-yaml' 'python-requests' 'python-referencing')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-responses')
source=("git+https://github.com/p1c2u/jsonschema-path.git#tag=$pkgver")
sha512sums=('a2afe55faba38adb11f45f3ca0e899f836253e37a5c77f985d09005b290332fdb5400d4efae1a971eb0087446f3d588c703a0cdcc77c1e9e6b48a357d2b74a8b')

prepare() {
  cd jsonschema-path
  sed -i '/--cov/d' pyproject.toml
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
