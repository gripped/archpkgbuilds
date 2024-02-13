# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.8.10
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(gcc-libs
         glibc
         python)
makedepends=(python-build
             python-installer
             python-maturin)
checkdepends=(python-pydantic
              python-pytest
              python-y-py)
source=(https://github.com/jupyter-server/pycrdt/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('af73d1efb55f98679fffec43e1de6703e9cbbe31cf0b786b893be61e45566e68')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
