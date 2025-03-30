# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Chaoswizard <chaoswizard@gmail.com>

pkgname=python-feedgenerator
pkgver=2.1.0
pkgrel=7
pkgdesc="Standalone version of Django's feedgenerator module"
url="https://github.com/getpelican/feedgenerator"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-pytz'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha512sums=('40c15c31d6752ab08a77869e6c8812a7e9a036dc081efcbad226621d4aa9b5e272bcf69275305b842515d3ebed5ad280bd4b9024c131fd9f8da3a13dae626690')

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
