# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.16.0
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
sha256sums=('7ac6e453eae85c70bb6ace3373d810a1b33c9f6d5bbfcd640c1325242c8debba')

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
