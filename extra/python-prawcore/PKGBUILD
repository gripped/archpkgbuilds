# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=3.2.0
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-vcrpy')
source=("git+https://github.com/praw-dev/prawcore.git#tag=v$pkgver")
sha512sums=('d828e393f2711e7e4e6bffa5f1ed28ea5cb7c91d5281011eadf17af332c3404bdc16c00c0e55cb6811cb84a4323d6ccd54e342265a1e69a9e1572787df17d464')

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
