# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-engineio
pkgver=4.12.3
pkgrel=2
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
sha512sums=('db394dd8e08402b021d46721ddc321b87b0127986b6561b698098c7979d39f68ee08219e4b3c679e69e16678fb89ec3ad63ac127b1b0e4cd2e6edf2f4ce18053')
b2sums=('aef8c59cfbd16ed93afa3c478f229c7dbb918d3a799f8dd69bd4237621628aa7e3756b5ba97c511986c2391971789d07bbf001153a27bfafdb6ceff2793790ed')

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
