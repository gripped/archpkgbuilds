# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_ydoc
pkgname=python-${_pyname//_/-}
pkgver=3.0.1
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
sha256sums=('cedae9f3ee0a77288317f21bb81848ed61674d1ba468b0c396c160a264a2106b')

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
