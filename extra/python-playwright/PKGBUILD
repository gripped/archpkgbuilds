# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

_name=playwright-python
pkgname=python-playwright
pkgver=1.51.0
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
sha256sums=('236f0c7421b8cb695763104d2d40083ca73433eae70e15f79ca06c0a2c6988b5'
            '9c9299606c097182324937031546cb3781030fad719b363203bfe2fbd45e9580')

prepare() {
  cd $_name
  sed -e 's|==.*\"|"|' -i pyproject.toml # Drop dependency version constraints
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
