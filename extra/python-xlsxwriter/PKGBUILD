# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.2.2
pkgrel=1
pkgdesc='A Python module for creating Excel XLSX files'
arch=('any')
url='https://github.com/jmcnamara/XlsxWriter'
license=('BSD-2-Clause')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$pkgname::git+$url#tag=RELEASE_$pkgver")
sha512sums=('190e27feb88557757aeb085cf966a785c8c13b9cd8b8189a9c02431dfd9b51cfc78bac91e55097c6d668bf53e0ad0704a742d52046983b33578b94c15ef6ccd5')
b2sums=('1eb3662a99985a9e3551be22a91b841553e677709b86ba6e087f3480a98ccfec1a10af20a06ed00034fbecbe63ece7179a6af982ac318b6cea459e0d41696488')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
