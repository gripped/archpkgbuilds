# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.13.0
pkgrel=2
pkgdesc='A Python implementation of the JSON5 data format'
arch=(any)
url='https://pypi.org/project/json5/'
license=(Apache-2.0)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(git+https://github.com/dpranke/pyjson5#tag=v$pkgver)
sha256sums=('58dc2fc8a3124cf39ced154e1dc52cd9d6bf5f3e6e7eb541c4e5d50ee5f99865')

build() {
  cd pyjson5
  python -m build --wheel --no-isolation
}

check() {
  cd pyjson5
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd pyjson5
  python -m installer --destdir="$pkgdir" dist/*.whl
}
