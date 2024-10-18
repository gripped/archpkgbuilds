# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=2.1.3
pkgrel=1
pkgdesc='Document structures for collaborative editing using Ypy'
arch=(any)
url='https://jupyter.org/'
license=(MIT)
depends=(python
         python-pycrdt)
makedepends=(python-build
             python-hatch-nodejs-version
             python-hatchling
             python-installer)
checkdepends=(python-pytest-asyncio
              python-websockets
              python-pycrdt-websocket
              python-ypy-websocket)
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('80830d501f48ca1f03d3eb3452371c607ff5c5703278a2e03e2af54765d0dd74')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
# No tests in pypi tarball
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
