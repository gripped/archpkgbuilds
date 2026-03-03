# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-path
# https://github.com/p1c2u/jsonschema-path/releases
pkgver=0.3.4
pkgrel=1
pkgdesc="JSONSchema Spec with object-oriented paths"
url="https://github.com/p1c2u/jsonschema-path"
# https://github.com/p1c2u/jsonschema-path/blob/0.3.4/pyproject.toml#L25
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-pathable' 'python-yaml' 'python-requests' 'python-referencing')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-responses')
source=("https://github.com/p1c2u/jsonschema-path/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('85b791a374d61bedf66a0ca44b6906ec74f02ffe991c1cb220267c85c0e7b493375d712d7ca0828681c9c15f170bc29d4b808b00778895fb13f1f7ff3cdf2a9c')

prepare() {
  cd jsonschema-path-$pkgver
  sed -i '/--cov/d' pyproject.toml
  # Allow newer referencing versions
  sed -i 's/referencing = "<0.37.0"/referencing = ">=0.28.0"/' pyproject.toml
}

build() {
  cd jsonschema-path-$pkgver
  python -m build -wn
}

check() {
  cd jsonschema-path-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd jsonschema-path-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
}
