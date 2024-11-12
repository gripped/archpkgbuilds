# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.9.28
pkgrel=1
pkgdesc='A Python implementation of the JSON5 data format'
arch=(any)
url='https://pypi.org/project/json5/'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/dpranke/pyjson5/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('368c39097fad3ba8d147118ae231f02e9012b7a8b9c8a24d6bbe849aad46e2e5')

build() {
  cd pyjson5-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyjson5-$pkgver
  pytest -v
}

package() {
  cd pyjson5-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
