# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=httpx-ws
pkgname=python-$_pyname
pkgver=0.10.0
pkgrel=1
pkgdesc='WebSocket support for HTTPX'
arch=(any)
url='https://frankie567.github.io/httpx-ws/'
license=(MIT)
depends=(python
         python-anyio
         python-httpcore
         python-httpx
         python-wsproto)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-pytest-cov
              python-starlette
              python-trio
              python-websockets
              uvicorn)
source=(git+https://github.com/frankie567/httpx-ws#tag=v$pkgver)
sha256sums=('6f5e0caeb3e55c27500ab377912adc470859a8c0b84024e635a0c6b1b534ea3f')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  pytest -v \
    --deselect tests/test_api.py::TestReceive::test_receive \
    --deselect tests/test_api.py::test_receive_close
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
