# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pysol_cards
pkgname=python-$_pyname
pkgver=0.18.1
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
sha256sums=('103c7c0c319e72e836e099bbb47ff54be729d975e35c11ba74d4ac5e4286b8eb')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
