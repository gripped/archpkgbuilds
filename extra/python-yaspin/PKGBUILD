# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yaspin
pkgver=3.5.0
pkgrel=1
pkgdesc="Yet Another Terminal Spinner"
url="https://github.com/pavdmyt/yaspin"
license=('MIT')
arch=('any')
depends=('python-termcolor')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("git+https://github.com/pavdmyt/yaspin.git#tag=v$pkgver")
sha512sums=('3f167f69ac99c07c9912378a87141af5b5c1e6b58b6c9d3f65421611f1f6cd8db72e62928d30d1c73f412ca6b6b4eb50a5e37302f75c71dd6cfce3b79a2c4e74')

build() {
  cd yaspin
  python -m build --no-isolation --wheel
}

check() {
  cd yaspin
  FORCE_COLOR=1 python -m pytest
}

package() {
  cd yaspin
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
