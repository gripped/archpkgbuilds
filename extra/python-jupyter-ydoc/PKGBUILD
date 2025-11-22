# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=3.3.1
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
              python-pycrdt-websocket)
source=(git+https://github.com/jupyter-server/jupyter_ydoc#tag=v$pkgver)
sha256sums=('43e8d3687bfc5d9dd663554275adc2300fff55926cc541d3fbfe186922699a63')

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
