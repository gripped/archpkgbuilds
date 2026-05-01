# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.0.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest-xdist')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('515174ddd4f7b418bf2cec1c92bc57f555da4abd8daf21e4be70482f240145fd58b09da0bd3c548c4b170315bfeb602006cc0818e4c086fb157c06c888607a4d')

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
