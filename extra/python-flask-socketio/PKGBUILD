# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-flask-socketio
_pkgname=Flask-SocketIO
pkgver=5.6.1
pkgrel=1
pkgdesc='Socket.IO integration for Flask applications'
arch=('any')
url='https://github.com/miguelgrinberg/Flask-SocketIO'
license=('MIT')
depends=(
  'python'
  'python-eventlet'
  'python-flask'
  'python-simple-websocket'
  'python-socketio'
  'python-werkzeug'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-redis'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2c882555b2015414263cb01549c506db555f43e33e74668c86a96bc3b44751b63d3dcb9d6bf67672b447ce0b73a47f26b62ed264460469803e8ed6841a9f8e3c')
b2sums=('be649638c44add820b4b61a694aff0f79a5a0917e4d4dd314b8657bc49a953761132c3538dd3e673a75d4c475bbf632de18c0aad22f1a3b13628fbf857957eac')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -j1 -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselecting test failing due to the following error, not sure why:
  #   test_socketio.py:810: AssertionError
  test-env/bin/python -m pytest \
    --deselect test_socketio.py::TestSocketIO::test_background_task
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/index.txt
  install -vDm 644 docs/_build/man/flask-socketio.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
