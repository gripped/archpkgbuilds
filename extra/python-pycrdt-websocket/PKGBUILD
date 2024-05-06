# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt-websocket
pkgname=python-$_pyname
pkgver=0.13.3
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(any)
url='https://github.com/jupyter-server/pycrdt-websocket'
license=(MIT)
depends=(python
         python-anyio
         python-pycrdt
         python-sqlite-anyio)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(hypercorn
              python-httpx-ws
              python-pytest
              python-pytest-asyncio
              python-trio
              python-websockets
              uvicorn)
source=(git+https://github.com/jupyter-server/pycrdt-websocket#tag=v$pkgver)
sha256sums=('7d86ac126cd18204ac3e76e9062c4f43c610c4463a6c197df5dee15f46c2c04d')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -k 'not test_pycrdt_yjs.py'
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
