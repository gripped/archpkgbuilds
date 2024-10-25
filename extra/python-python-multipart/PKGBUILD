# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.14
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://github.com/andrew-d/python-multipart'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c53d3e8faec421dd05cd9c3695e80555ee9fdd65cf616fb65b4a948fa2ca86119e076d7b6b7aa1add386306774a5de1a03811b36eaf1cc36d6ab5310573ed0f3')

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
