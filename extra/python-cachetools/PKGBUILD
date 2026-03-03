# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachetools
pkgver=7.0.2
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tkem/cachetools.git#tag=v$pkgver")
sha512sums=('f1ecb0df69993dc07fe9c28b00bd98b40a1561d556cbd935ffb6625e6ca496af76d57129411cef4a4c0f2d0cd9728a4c27c0f6db6ed9b2e8a0926056d2a12d29')

build() {
  cd cachetools
  python -m build --wheel --no-isolation
}

check() {
  cd cachetools
  PYTHONPATH=src pytest
}

package() {
  cd cachetools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
