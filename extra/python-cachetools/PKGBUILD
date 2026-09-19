# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachetools
pkgver=7.2.0
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
url="https://github.com/tkem/cachetools"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tkem/cachetools.git#tag=v$pkgver")
sha512sums=('8af5030ac3b6bd020b348922beca5bf466c7ea28d9404625ed6e1d17f43ce3a6dd3184d7de1d0875fca04c2fe7212b4c19fbdc96a31119a98aeff1595c4ddcf9')

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
