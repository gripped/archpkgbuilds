# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

_name=playwright-python
pkgname=python-playwright
pkgver=1.65.1
pkgrel=1
pkgdesc='A Python library to automate Chromium, Firefox and WebKit browsers with a single API'
arch=(any)
url='https://github.com/microsoft/playwright-python'
license=(Apache-2.0)
depends=(
  nodejs
  python
  python-greenlet
  sh
)
makedepends=(
  git
  npm
  python-auditwheel
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-autobahn
  python-flaky
  python-objgraph
  python-pixelmatch
  python-pyee
  python-pyopenssl
  python-pytest
  python-pytest-playwright
  python-requests
)
source=(
  git+https://github.com/microsoft/$_name#tag=v$pkgver
  git+https://github.com/microsoft/playwright.git
)
sha256sums=('689943058f5b0f9b09f4383212ea064860ed5a7dcdbbdaa4de63153a1f93081f'
            'SKIP')

prepare() {
  cd $_name
  sed -e 's|==.*\"|"|' -i pyproject.toml # Drop dependency version constraints

  mv ../playwright .upstream
  git -C .upstream checkout $(cat DRIVER_VERSION)
}

build() {
  cd $_name
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
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
