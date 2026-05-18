# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=playwright-pytest
pkgname=python-pytest-playwright
pkgver=0.8.0
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
sha256sums=('4b716fbf203608c28e9be3f010b0028d3e1e1d869aa931ec7b397a20b6224234')

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
