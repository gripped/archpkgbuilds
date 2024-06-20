# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=scs
pkgname=python-$_pyname
pkgver=3.2.4.post3
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
sha256sums=('a6ee9cb167c3d3bc57e023ee70df15ecb1fccc3eec286a02198f35198d56b612')

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
