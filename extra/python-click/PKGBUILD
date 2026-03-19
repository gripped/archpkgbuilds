# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python-click
pkgver=8.3.2
pkgrel=1
pkgdesc="Simple wrapper around optparse for powerful command line utilities"
arch=('any')
url='https://click.palletsprojects.com/'
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=('python-pytest')
source=("https://github.com/pallets/click/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('da2511a4e25d61b62c1b8be95b4bd39948f8a83fbed6c3ef8ecbe2832128e81d2a356455f8d33aa6c00ff17199c7bcf7d590e85c504feefb26c5a7b4da117d97')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
