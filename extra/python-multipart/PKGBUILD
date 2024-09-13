# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=multipart
pkgname=python-$_pkgname
pkgver=0.2.5
pkgrel=1
pkgdesc='Parser for multipart/form-data'
arch=('any')
url='https://github.com/defnull/multipart'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('268b958dfc7ab8c673c9d06ef3b26bcdec2df396289e60037ebd14f22731766ae95328b892116d5eb90210025d76f7667b59d82753e4a8c644dcd7ed383bf98d')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
