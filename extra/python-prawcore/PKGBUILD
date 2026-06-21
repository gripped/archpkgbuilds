# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=3.2.1
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-vcrpy')
source=("git+https://github.com/praw-dev/prawcore.git#tag=v$pkgver")
sha512sums=('3ee4fe1e56057e13c21fb8325cfb2ea3f98eb03457233aae3ce21c231493e8051443cb4abcf3b29e72b25783dd0aad699a836bcbf7f11eab815c151c64877b63')

prepare() {
  cd prawcore
  sed -i 's/flit_core>=3.12.0,<4/flit_core/' pyproject.toml
}

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
