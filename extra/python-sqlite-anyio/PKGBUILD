# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.2
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
sha256sums=('e77ef05b282b2ed5cf3d5a94457f3c11aba975422162f449573947867852c33e')

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
