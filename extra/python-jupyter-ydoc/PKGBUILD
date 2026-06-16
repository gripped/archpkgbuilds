# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=4.0.0
pkgrel=1
pkgdesc='Document structures for collaborative editing using Ypy'
arch=(any)
url='https://jupyter.org/'
license=(MIT)
depends=(python
         python-anyio
         python-pycrdt)
makedepends=(git
             python-build
             python-hatch-nodejs-version
             python-hatchling
             python-installer)
checkdepends=(hypercorn
              python-pytest-asyncio
              python-websockets
              python-pycrdt-websocket)
source=(git+https://github.com/jupyter-server/jupyter_ydoc#tag=v$pkgver)
sha256sums=('b9b4b41609fd0aeda5c81c0b2083204434e47cdb1b721227e40ba642f113b2f9')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
#  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
