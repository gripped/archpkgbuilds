# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.20.5
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('63ebd7ffc5c52c0388da16c13fdb1d09b15faae299baa44831252ea43dd499eed06d5a391050d720b42bd0d4587ec68de04b0e6e0146d47ff19b5380232d26bb')

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
