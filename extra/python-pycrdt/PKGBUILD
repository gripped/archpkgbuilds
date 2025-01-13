# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.12.3
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
              python-trio
              python-y-py)
source=(git+https://github.com/jupyter-server/pycrdt#tag=$pkgver)
sha256sums=('5b998e894adc78ac523aac9b0a91d90e82a96804ffc5749a3d2b1255c84eca2b')

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
