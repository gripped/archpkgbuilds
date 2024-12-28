# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=tox-current-env
pkgname=python-$_pkgname
pkgver=0.0.14
pkgrel=1
pkgdesc='tox plugin to run tests in current Python environment'
arch=('any')
url='https://github.com/fedora-python/tox-current-env'
license=('MIT')
depends=('python' 'python-tox')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ba4df20c94761b85c8d213424c92712d5254cbd2fd46c36193b0198870a3995e0773a91bfd07b4c76ac8ceedda753feda3ae2c22645e9c5b7d2dbc9c0670bd08')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
