# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-scs
pkgver=3.2.11
pkgrel=2
pkgdesc='Splitting Conic Solver'
url='https://github.com/bodono/scs-python'
license=(MIT)
arch=(x86_64)
depends=(blas
         glibc
         lapack
         python
         python-scipy)
makedepends=(git
             meson-python
             python-build
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/bodono/scs-python#tag=$pkgver
        git+https://github.com/cvxgrp/scs)
sha256sums=('03386b682a331d2dd72c49956aed5cfa2a9b6a1c1e5abb45c1b6dda991db640b'
            'SKIP')

prepare() {
  cd scs-python
  git submodule init
  git submodule set-url scs_source "$srcdir"/scs
  git -c protocol.file.allow=always submodule update
}

build() {
  cd scs-python
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd scs-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd scs-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
