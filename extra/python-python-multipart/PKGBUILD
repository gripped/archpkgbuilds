# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.29
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://multipart.fastapiexpert.com'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kludex/python-multipart/archive/$pkgver.tar.gz")
sha512sums=('37a20b6fdb26fda1513e6911bbcc699b169a3317bd30c37536a0c3bb3333500cbca432f345c8e199d36e7134a152a9bf471dd3073e3aa48964281fb12c56f8c0')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  pytest -v
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
