# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=3.0.4
pkgrel=1
pkgdesc='Document structures for collaborative editing using Ypy'
arch=(any)
url='https://jupyter.org/'
license=(MIT)
depends=(python
         python-pycrdt)
makedepends=(git
             python-build
             python-hatch-nodejs-version
             python-hatchling
             python-installer)
checkdepends=(hypercorn
              python-pytest-asyncio
              python-websockets
              python-pycrdt-websocket
              python-ypy-websocket)
source=(git+https://github.com/jupyter-server/jupyter_ydoc#tag=v$pkgver)
sha256sums=('3b87f39e459e2d856da7dd69349bb7f2832d2c3b73e181174586976bb90fce01')

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
