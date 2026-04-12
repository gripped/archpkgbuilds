# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.26
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://multipart.fastapiexpert.com'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kludex/python-multipart/archive/$pkgver.tar.gz")
sha512sums=('8d5f569428d4795dc1cac3b2fef356598e986cddb53e3b121aba6acdd53dc389e9bfa834deb45c4a0cfa25077f1f2f33203977b5c6767e8b52c1d080edc149d6')

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
