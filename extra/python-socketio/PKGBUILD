# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-socketio
pkgver=5.13.0
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
sha512sums=('4835d27048c04c0524a08174482a32a3fc7b26b9dc35092ce69c2162102ba53362effa15a9e4319d9fee62d1c8d7d14b4ed828d0d9cfc313429cf1b9107fd6d7'
            'dbf2846cfc0193baefdc5a26c58f3378b13a0b18c2a87f0403841a97ed06d795c68c7fd6128429c7bb3edb6e53389a06dbf915028479933c849fcd7ffb8e6729')
b2sums=('5eea6c07adf3a65bc5a332a367311654de0fde3ff98459716983ab7df36b1018ea0878251c75cd9d3eddfdcd2ba800b8b0e7b65a3c067e3d5afa9d9a2e9de976'
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
  test-env/bin/python -m pytest
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
