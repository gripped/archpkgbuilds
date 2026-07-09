# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.5.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/syrupy-project/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-attrs' 'python-hypothesis' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/syrupy-project/syrupy.git#tag=v$pkgver")
sha512sums=('61102c17eb78e0cbeacc001e2bfad2691f1770c09c9a2e5f6c0bd4e5edf9bf30c115dc39d42f4f10fc92a9dd30f7d8b4e461f70e1dfe930ecf9844941ad763cb')

prepare() {
  cd syrupy
  sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
}

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
