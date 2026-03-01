# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

_pyname=pixelmatch-py
pkgname=python-pixelmatch
pkgdesc='A pixel-level image comparison library'
pkgver=0.3.1
pkgrel=1
arch=(any)
url='https://github.com/whtsky/pixelmatch-py'
license=(ISC)
depends=(python
         python-pillow)
makedepends=(git
             python-build
             python-installer
             python-poetry-core)
checkdepends=(libpng
              python-pytest
              python-pytest-benchmark)
source=(git+https://github.com/whtsky/pixelmatch-py#tag=v$pkgver)
sha256sums=('8a9f94be9c0074e943566961c8be4d464d29ee0a4a9e1e05aa8474d813830582')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
#  Test data is broken
#  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
