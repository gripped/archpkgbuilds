# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-simplejson
pkgver=4.0.1
pkgrel=1
pkgdesc='Simple, fast and extensible JSON decoder/encoder'
license=(MIT)
arch=(x86_64)
url='https://github.com/simplejson/simplejson'
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$url/archive/v$pkgver/$pkgname-v$pkgver..tar.gz")
b2sums=('e8e5a3faf6af1c3ba1651a2b5a707834f2cd3cde8e5bdbd952d41972d03b878b727403432caf3128fd63db0c67008f2b847c7b0f8fad8e6f427e2e857fc3b7b7')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m unittest discover -v
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
