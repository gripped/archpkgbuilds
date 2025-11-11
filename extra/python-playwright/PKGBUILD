# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

_name=playwright-python
pkgname=python-playwright
pkgver=1.56.0
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
        https://playwright.azureedge.net/builds/driver/playwright-$pkgver-linux.zip
        auditwheel-6.3.patch)
noextract=(playwright-$pkgver-linux.zip)
sha256sums=('20f7845d48308065ee109871defb95133443acfc662a45a0552fd881a403cba3'
            '2ca38c2957c618e7b421e77890a8b8c0b7b1b7a79abaabb8cd66227558bc6b11'
            '8af7d2f2a41582212fc20665ec5a38e569b79195d85ec35e25f4ec421cb5db32')

prepare() {
  cd $_name
  sed -e 's|==.*\"|"|' -i pyproject.toml # Drop dependency version constraints
  sed -e "s|driver_version = \".*\"|driver_version = \"$pkgver\"|" -i setup.py
  install -Dm644 "$srcdir"/playwright-$pkgver-linux.zip -t driver

  patch -p1 -i ../auditwheel-6.3.patch
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
