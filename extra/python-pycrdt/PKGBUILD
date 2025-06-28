# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.12.23
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
              python-trio
              python-y-py)
source=(git+https://github.com/jupyter-server/pycrdt#tag=$pkgver)
sha256sums=('c75b6567e5305af8dc52c70af990878e08bb4a4e83f8b8b61a3ee1c63f96859d')

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
