# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=multipart
pkgname=python-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc='Parser for multipart/form-data'
arch=('any')
url='https://github.com/defnull/multipart'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('df25d9a1aa8f8ee42b8016f29f73dc8b2b1dc2d4a1f0aa139441708d7dc9bb80f72b726cc83111da32c38968723c097bad70d026871b4edb699e208b4412707b')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
