# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=gunicorn
pkgver=25.1.0
pkgrel=1
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url='https://gunicorn.org/'
license=('MIT')
depends=('python-packaging')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-eventlet'
  'python-gevent'
  'python-h2'
  'python-httpx'
  'python-pytest'
  'python-pytest-asyncio'
)
optdepends=(
  'python-eventlet: for asynchronous request handling with eventlet'
  'python-gevent: for asynchronous request handling with gevent'
  'python-h2: for HTTP/2 support'
  'python-setproctitle: for process renaming'
  'python-tornado: for asynchronous request handling with tornado'
)
source=("git+https://github.com/benoitc/$pkgname.git#tag=$pkgver")
b2sums=('77a976ca86533da8f24884f6e8b607bc6c4f61cb4f1a203dd99cda769a63e0d27c09cef0e614f6119a31992bcec4068ddadf04301f02977fe06f5f6ceed447a9')

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
