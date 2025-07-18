# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Chaoswizard <chaoswizard@gmail.com>

pkgname=python-feedgenerator
pkgver=2.2.0
pkgrel=1
pkgdesc="Standalone version of Django's feedgenerator module"
url="https://github.com/getpelican/feedgenerator"
arch=('any')
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha512sums=('b3cbf9c09821b184767f5291388c62af91e5897289ddcf199fcf0cbd4199964127d4af88ab1f87427195a77c30dd200159ef61646cc3db393f1afff4a5ad0888')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
