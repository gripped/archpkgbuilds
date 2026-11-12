# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=gunicorn
pkgver=27.0.0
pkgrel=1
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url='https://gunicorn.org/'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-gevent'
  'python-h2'
  'python-httpx'
  'python-packaging'
  'python-pytest'
  'python-pytest-asyncio'
)
optdepends=(
  'python-gevent: for asynchronous request handling with gevent'
  'python-h2: for HTTP/2 support'
  'python-packaging: for gevent worker version checks'
  'python-setproctitle: for process renaming'
  'python-tornado: for asynchronous request handling with tornado'
  'python-uvloop: for ASGI event loop performance'
)
source=("git+https://github.com/benoitc/$pkgname.git#tag=$pkgver")
b2sums=('eae0a78103ec9c78cf3be8b3e0441de8b02a938aa6f810415a9866cc057bba37a527754d00acf51027cdd5ea79c0a02b251120f3cb7e3765ce82305af48c43f6')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # Override addopts as they invoke coverage testing
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v --override-ini="addopts=" tests/test_signal_integration.py
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
