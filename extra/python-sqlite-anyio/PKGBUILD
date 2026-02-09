# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.5
pkgrel=1
pkgdesc='Asynchronous client for SQLite using AnyIO'
arch=(any)
url='https://github.com/davidbrochart/sqlite-anyio'
license=(MIT)
depends=(python
         python-anyio)
makedepends=(git
             python-build
             python-installer
             python-uv-build)
checkdepends=(python-pytest
              python-trio)
source=(git+https://github.com/davidbrochart/sqlite-anyio#tag=$pkgver)
sha256sums=('6800182cab3e89a4a0a3fe0753c19fe9b35e90d90ad50830a6615a299b088e9b')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  PYTHONPATH="$PWD"/src \
  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
