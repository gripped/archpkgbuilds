# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.20.6
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('461df6c16f003d038d5ab4f9a85c72946a007afb541c8cc59ab9247e20566e7ed845ea03008981fc38b82c250521feb24404b9d4833e41d5f73dcb7699a89e25')

build() {
  cd validators
  python -m build -nw
}

check() {
  cd validators
  python -m pytest
}

package() {
  cd validators
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
