# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.14.3
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(glibc
         libgcc
         python
         python-anyio)
makedepends=(git
             python-build
             python-installer
             python-maturin)
checkdepends=(python-anyio
              python-pydantic
              python-pytest
              python-pytest-mypy-testing
              python-trio)
source=(git+https://github.com/jupyter-server/pycrdt#tag=$pkgver)
sha256sums=('7cce734af11521a6c0cd291d7621e1af4ea0357db045b54bdd42dc4d7a0d4c93')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v \
    -k 'not test_types.py'
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
