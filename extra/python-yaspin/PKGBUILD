# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yaspin
pkgver=3.3.0
pkgrel=1
pkgdesc="Yet Another Terminal Spinner"
url="https://github.com/pavdmyt/yaspin"
license=('MIT')
arch=('any')
depends=('python-termcolor')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("git+https://github.com/pavdmyt/yaspin.git#tag=v$pkgver")
sha512sums=('2e15701202dc7098483ae7bc2617ff6b5eb8aabe2a841ff67aa51fe69b1d5c32c0ddabc26508c148b506d235a4998e4d1fa5cc755c8dfa5d606b272e9ea0ed83')

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
