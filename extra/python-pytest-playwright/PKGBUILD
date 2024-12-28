# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=playwright-pytest
pkgname=python-pytest-playwright
pkgver=0.6.2
pkgrel=2
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
sha256sums=('1f9551d908e73ffc199ec72f5f2f533cc0785f121412eb534347d1c7629b3b22')

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
