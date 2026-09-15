# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-simplejson
pkgver=4.1.2
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
b2sums=('6cc492aa156cd2bc2b786cbaf5614db0e13780007398837bd1d3e878e1662f21d3207e2b97f99fc072b2089fdfec000f8d0805869118075e5adc573524e0d775')

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
