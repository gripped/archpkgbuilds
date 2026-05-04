# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachetools
pkgver=7.1.1
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tkem/cachetools.git#tag=v$pkgver")
sha512sums=('9ccfd2c151d5f9e421c639b847b1a9ea9ba7990eb0f9a973313118d0aa7dc6d19812fdc4bedc2613d614062b79f4e9c441ef6687a1a853319ea441e62bb94c6f')

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
