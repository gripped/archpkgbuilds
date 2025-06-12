# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt-store
pkgname=python-$_pyname
pkgver=0.1.1
pkgrel=1
pkgdesc='Persistent storage for pycrdt'
arch=(any)
url='https://github.com/y-crdt/pycrdt-store'
license=(MIT)
depends=(python
         python-anyio
         python-pycrdt
         python-sqlite-anyio)
makedepends=(git
             python-build
             python-hatchling
             python-installer
             python-trio)
checkdepends=(python-pytest)
source=(git+https://github.com/y-crdt/pycrdt-store#tag=$pkgver)
sha256sums=('055d394509e2e61b60c0b96e6c8a8931cb7b691ce28858604ca9a753e452fde6')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
# hack to allow importing pycrdt/store from the venv
  cp -r /usr/lib/python*/site-packages/pycrdt/ test-env/lib/python*/site-packages
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
