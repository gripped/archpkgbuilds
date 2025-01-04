# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pysol_cards
pkgname=python-$_pyname
pkgver=0.18.0
pkgrel=3
pkgdesc='Deal PySol FC Cards'
arch=(any)
url='https://pypi.org/project/pysol-cards/'
license=(MIT)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.io/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('29196eadd51a54a7bf853d0aecba168853903a24803b8554713e8c7fcc732c2c')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
