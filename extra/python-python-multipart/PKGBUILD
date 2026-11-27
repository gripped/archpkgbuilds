# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_pkgname=python-multipart
pkgname=python-$_pkgname
pkgver=0.0.34
pkgrel=1
pkgdesc='streaming multipart parser for Python'
arch=('any')
url='https://multipart.fastapiexpert.com'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kludex/python-multipart/archive/$pkgver.tar.gz")
sha512sums=('5cf83f77f3dc26c387f63239870b2a97f8169592aabf288fcb6a95abe9333f1e6da6d1ae1c5c0fd094a13af240ff6e56bf4a5712e8b118f96aa3b17b66fbea90')

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
