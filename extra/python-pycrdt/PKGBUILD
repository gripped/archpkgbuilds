# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.8.27
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(gcc-libs
         glibc
         python)
makedepends=(git
             python-build
             python-installer
             python-maturin)
checkdepends=(python-objsize
              python-pydantic
              python-pytest
              python-y-py)
source=(git+https://github.com/jupyter-server/pycrdt#tag=v$pkgver)
sha256sums=('fc5e0d2bb5bd9d5d8f1b7778fd1827c169d2544cb6754d82bf54e63ced9fcd54')

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
