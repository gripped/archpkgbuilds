# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.28
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://multipart.fastapiexpert.com'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kludex/python-multipart/archive/$pkgver.tar.gz")
sha512sums=('6631866906882fff1b44627e28d2d3f178b2bd569e1675b10f50ea673889bd93300958834ed8947092442b622d782754020669ec6ffee981bfedd96d1229428e')

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
