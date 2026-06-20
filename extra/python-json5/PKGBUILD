# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.15.0
pkgrel=1
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
sha256sums=('6be4317cf94b5206622b9856260d3b05c87c8ff89ed4cfb8f158bd04253b83f6')

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
