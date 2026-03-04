# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yaspin
pkgver=3.2.0
pkgrel=1
pkgdesc="Yet Another Terminal Spinner"
url="https://github.com/pavdmyt/yaspin"
license=('MIT')
arch=('any')
depends=('python-termcolor')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("git+https://github.com/pavdmyt/yaspin.git#tag=v$pkgver")
sha512sums=('577cce06f0a72a367a2efdc717cfcc8b93211536f7fd0825901983f3001cae5ecc8bea8b00b2f625087e88280f09d2d81487bef7c6b46215d2b6df9601a9f49b')

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
