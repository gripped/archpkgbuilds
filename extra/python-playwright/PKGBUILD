# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

_name=playwright-python
pkgname=python-playwright
pkgver=1.46.0
pkgrel=1
pkgdesc='A Python library to automate Chromium, Firefox and WebKit browsers with a single API'
arch=(any)
url='https://github.com/microsoft/playwright-python'
license=(Apache-2.0)
depends=(nodejs
         python
         python-greenlet
         python-pyee
         sh)
makedepends=(git
             python-auditwheel
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
checkdepends=(python-autobahn
              python-flaky
              python-objgraph
              python-pixelmatch
              python-pyopenssl
              python-pytest chromium
              python-pytest-playwright
              python-requests)
source=(git+https://github.com/microsoft/$_name#tag=v$pkgver
        https://playwright.azureedge.net/builds/driver/playwright-$pkgver-linux.zip)
noextract=(playwright-$pkgver-linux.zip)
sha256sums=('56f5b1dcfa50f4b82c26ac29134e5626afd611af1656ace0b1a3bf345f01f30d'
            '73d00b1fd153160be2bbec2aa1afb71ebbb03e44a3e0d9aa4ca2de78e38109fd')

prepare() {
  cd $_name
  sed -e 's|==.*\"|"|' -i pyproject.toml -i setup.py # Drop dependency version constraints
  sed -e "s|driver_version = \".*\"|driver_version = \"$pkgver\"|" -i setup.py
  install -Dm644 "$srcdir"/playwright-$pkgver-linux.zip -t driver
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

# Testing is utterly broken
#check() {
#  cd $_name
#  PYTHONPATH=$PWD \
#  pytest -v
#}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl

# Replace bundled node with system one
  rm "$pkgdir"/usr/lib/python*/site-packages/playwright/driver/node
  ln -s /usr/bin/node -t "$pkgdir"/usr/lib/python*/site-packages/playwright/driver/
}
