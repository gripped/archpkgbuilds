# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python-click
pkgver=8.5.1
pkgrel=1
pkgdesc="Simple wrapper around optparse for powerful command line utilities"
arch=(any)
url='https://click.palletsprojects.com/'
license=(BSD-3-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  less
  python-pytest
)
source=(
  "https://github.com/pallets/click/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
b2sums=('a6bf3f1a2a1393c75cd7a5de6fbfeff1068215299b7bf1f2c8e7deed41f38744711880029c56556b9652646f98d7db8dac207d8f287184afe4dcedb8b2472b43')

prepare() {
  cd ${pkgname#python-}-$pkgver
  sed 's/,<4//' -i pyproject.toml
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
