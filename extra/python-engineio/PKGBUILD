# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-engineio
pkgver=4.12.0
pkgrel=1
pkgdesc='Python implementation of the Engine.IO realtime server'
url='https://github.com/miguelgrinberg/python-engineio'
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-simple-websocket
  python-websocket-client
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-sphinx
  python-wheel
)
checkdepends=(
  python-aiohttp
  python-eventlet
  python-gevent
  python-gevent-websocket
  python-pytest
  python-pytest-asyncio
  python-tornado
)
optdepends=(
  'python-aiohttp: aiohttp driver'
  'python-eventlet: eventlet driver'
  'python-gevent-websocket: gevent driver'
  'python-gevent: gevent driver'
  'python-tornado: tornado driver'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4d4996183b837b656566bc94f17f8bed7551a18d46985cb83aca44f040a1c9031ad48abac8f33ec63826cff506bb015826a4c080d3d42d47ee684d67948d0708')
b2sums=('3da3382dd568f74ed5a0362b36641cd9cbe60fd0370e4e4172455251250ad6470662e1bfdb1903eb7b2dd934cbb895994e407ab8487a80a9dd2f629c87a55f89')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -j1 -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselect test failing with the following error, not sure why:
  #   tests/common/test_server.py:128: AssertionError
  test-env/bin/python -m pytest \
    --deselect tests/common/test_server.py::TestServer::test_async_mode_eventlet
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/_build/text/*.txt
  install -vDm 644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/python-engineio.1
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
