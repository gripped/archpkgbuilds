# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-socketio
pkgver=5.14.1
pkgrel=1
pkgdesc='Python implementation of the Socket.IO realtime server'
url='https://github.com/miguelgrinberg/python-socketio'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-bidict'
  'python-engineio'
  'python-msgpack'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-tornado'
  'python-wheel'
)
checkdepends=(
  'python-aiohttp'
  'python-eventlet'
  'python-gevent'
  'python-gevent-websocket'
  'python-pytest'
  'python-pytest-asyncio'
  'python-tornado'
  'uvicorn'
)
optdepends=('python-tornado: tornado asyncio webserver')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-fix-type-error-freezing-tests.patch"
)
sha512sums=('bea48a4d7e47323dba385a760cc12978abac27c1f1fc2d9f39d2e19870fbb3172a2135bb639af91b68c40a4fd189208a699cb8765eadedea84b0e454c4233477'
            'dbf2846cfc0193baefdc5a26c58f3378b13a0b18c2a87f0403841a97ed06d795c68c7fd6128429c7bb3edb6e53389a06dbf915028479933c849fcd7ffb8e6729')
b2sums=('bb0aecf67434578dc028404563958ffd8c07f5520cfc80676997e120646d16e024ce8cd93732626be8a2f455e12ccd29fcdabf1f39d1f072d3b7da62e23ff055'
        '0dbcfe86665a986b422268fd9ffd03c72ba63cf97571078453d085a13b9793ee8552d99c81ed0cf77ea02b71e14252f607dfe7c819bb7b71a77fd258c242c156')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../$pkgname-fix-type-error-freezing-tests.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -j1 -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Ignored tests depend both python-redis & python-valkey, the latter which is
  # not packaged.
  test-env/bin/python -m pytest \
    --ignore=tests/async/test_redis_manager.py \
    --ignore=tests/common/test_redis_manager.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm 644 docs/_build/text/index.txt "$pkgdir/usr/share/doc/$pkgname/DOCUMENTATION"
  install -vDm 644 docs/_build/man/python-socketio.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
