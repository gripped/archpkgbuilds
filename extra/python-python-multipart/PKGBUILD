# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.16
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://github.com/andrew-d/python-multipart'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c2a58f96425217d08e71307e9d1a7649df70ee8a1d8587d1fc2d01e39863837cd56fe6acdcdac3c04e6790a744ac2074b82278073652a47b9178e584a040cb97')

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
