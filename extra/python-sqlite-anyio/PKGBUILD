# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=sqlite-anyio
pkgname=python-$_pyname
pkgver=0.2.9
pkgrel=1
pkgdesc='Asynchronous client for SQLite using AnyIO'
arch=(any)
url='https://github.com/davidbrochart/sqlite-anyio'
license=(MIT)
depends=(python
         python-anyio
         python-typing_extensions)
makedepends=(git
             python-build
             python-installer
             python-uv-build)
checkdepends=(python-pytest
              python-trio)
source=(git+https://github.com/davidbrochart/sqlite-anyio#tag=$pkgver)
sha256sums=('3f81b079e7fd51b3bc242d079713c9fd54e1c7d4f0b344e78a39b8b4f08f9963')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
