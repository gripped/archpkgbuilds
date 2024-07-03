# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=scs
pkgname=python-$_pyname
pkgver=3.2.5
pkgrel=1
pkgdesc='Splitting Conic Solver'
url='https://github.com/cvxgrp/scs/'
license=(MIT)
arch=(x86_64)
depends=(blas
         glibc
         lapack
         python
         python-scipy)
makedepends=(meson-python
             python-build
             python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('dde777756b0aa9813f88224193883a494149b3f8c3c5b3dd6082c6e8b6bbe262')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
