# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=playwright-pytest
pkgname=python-pytest-playwright
pkgver=0.7.2
pkgrel=1
pkgdesc='Pytest plugin to write end-to-end browser tests with Playwright'
arch=(any)
url='https://github.com/microsoft/playwright-pytest'
license=(Apache-2.0)
depends=(python
         python-pytest
         python-slugify)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/microsoft/$_name#tag=v$pkgver)
sha256sums=('94f85cebdfd09f61fa2132952460f22db68e2fdc5c9c82ece7cb783a8dde029b')

build() {
  cd $_name/pytest-playwright
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_name/pytest-playwright
#  pytest -v
}

package() {
  cd $_name/pytest-playwright
  python -m installer --destdir="$pkgdir" dist/*.whl
}
