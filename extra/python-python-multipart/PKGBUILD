# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.21
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://multipart.fastapiexpert.com'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kludex/python-multipart/archive/$pkgver.tar.gz")
sha512sums=('905f83423a473027ea97102f5c6f6da434db9529547513c12155285b1c7f32f03764393b8386c0da0ed6938f457119f787c3fc9b471e55d92641aa4067e95cfd')

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
