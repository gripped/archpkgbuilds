# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.13.0
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(gcc-libs
         glibc
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
sha256sums=('d1ed52d9b0624ed5cf838363f8f263b0949557884914132c1c6d3ce20236fee1')

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
