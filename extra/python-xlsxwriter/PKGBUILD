# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.3.1
pkgrel=1
pkgdesc='A Python module for creating Excel XLSX files'
arch=(any)
url='https://github.com/jmcnamara/XlsxWriter'
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=("$pkgname::git+$url#tag=RELEASE_$pkgver")
sha512sums=('54540f1eac484bb41e9c08f542d9fd151c5bb07867be2aaa103695d1f5d4a39401d97633cc49d87f868ba721aea7640d3bf3de7fa2f686526c86977e5ab6ec5f')
b2sums=('34086feb16da71febfecbcb324b8dd65b68c9c3295dac7ecbd8a8403a94d51978370f635bc2f1feaf5eda7ce84971694ac81b1b6f21efadd91083bdb511dafa1')

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
