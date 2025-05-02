# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pysol_cards
pkgname=python-$_pyname
pkgver=0.22.0
pkgrel=1
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
sha256sums=('c555ef5e05ad41774e742b603ce6e6ba76e5d013ddf4ae087a3d87c55279f142')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
