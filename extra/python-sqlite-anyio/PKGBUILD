# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.4
pkgrel=1
pkgdesc='Asynchronous client for SQLite using AnyIO'
arch=(any)
url='https://github.com/davidbrochart/sqlite-anyio'
license=(MIT)
depends=(python
         python-anyio)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-trio)
source=(git+https://github.com/davidbrochart/sqlite-anyio#tag=v$pkgver)
sha256sums=('f30f077c5c16e5e92e95825dea4d3d591e376266ff7a839c50dd94314d4a6479')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  PYTHONPATH="$PWD" \
  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
