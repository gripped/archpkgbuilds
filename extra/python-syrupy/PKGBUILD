# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.5.2
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
sha512sums=('e61e40ac8a8ebc34ac561b012264ea02f1b591071809d3c68bdb90233ad8e7094dc9ffae4d9feb212536ea16fbfd84f5c4d429a5d6df974c169e4afc0deae74b')

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
