# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.1.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-attrs' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('b5f82ff3b6e15ecfbad99902e844ec1c4d94aafd2e6cd3832851369202690c39785714a68b951bde3be1a40d7ea90a4966e7ce3b54982909a08a7b26d3282a5b')

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
