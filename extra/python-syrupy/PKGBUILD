# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.6.2
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('3c3d2206d86b649c6b35fa3b17eff75ec84117ca359b7f8e68adff04482929c255c26548626e880b2478c4f243cd0f1b12f15592035d9e975e24e89e9d77431c')

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
}
