# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.2.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-attrs' 'python-hypothesis' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('61552460b151ae5d7305446bc5f40152d9e2cd291acd874db85dcad58a576b072394f92997ba5cedfd36abc4b922f18120faf043e21d770df936a1d6a1e3935d')

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
