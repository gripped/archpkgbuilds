# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=3.0.2
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-betamax' 'python-pytest' 'python-urllib3')
source=("git+https://github.com/praw-dev/prawcore.git#tag=v$pkgver")
sha512sums=('d5ab25ec32bdaf128c269bc12602b013434fdab58f082654426c6190762f20d214ddeef3b5107b376e6898f297bbffe68f753ab7e0838081ed1d28a9a6e46a43')

build() {
  cd prawcore
  python -m build -nw
}

check() {
  cd prawcore
  pytest
}

package() {
  cd prawcore
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
