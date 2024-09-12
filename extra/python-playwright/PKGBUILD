# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

_name=playwright-python
pkgname=python-playwright
pkgver=1.47.0
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
sha256sums=('a0e13cf260a0ed3dfff4654837246873fe5c5876b3975d6eadc31e44bbd54475'
            '5216ea6f88dbf4a5bf6cfb1255513db331d393697152b62eb36594361043d79f')

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
