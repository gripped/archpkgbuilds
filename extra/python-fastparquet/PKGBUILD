# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fastparquet
pkgver=2026.5.0
pkgrel=1
pkgdesc="A Python implementation of the Parquet columnar file format"
arch=(x86_64)
url="https://github.com/dask/fastparquet"
license=(Apache-2.0)
depends=(
  glibc
  python
  python-cramjam
  python-fsspec
  python-numpy
  python-packaging
  python-pandas
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         https://github.com/dask/fastparquet/commit/fb5634c2aac83a22011a8d06c05899bc68774fa8.patch)
b2sums=('92831c9b857ba966db43f10f583a68bba1e23d1c5200fbf44397bb0e1a4806700f49fda93ef4be00a57c068ebe9f1eb8b8d10d576b5d363912398e7c96d7c85b'
        '855b813d563cc314468dddcdf950c0b3e8c33b1def0981c67b365c5369795cfd96fb6584cebc200ee2ddf9ea3d7a71dc9013f8de802ec860023489fa693e1a6c')

prepare() {
  cd ${pkgname#python-}-$pkgver
  patch -p1 -i ../fb5634c2aac83a22011a8d06c05899bc68774fa8.patch # NumPy 2.5
}

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -r fastparquet/test test-data "$PWD/tmp_install/$site_packages"
  (cd "$PWD/tmp_install/$site_packages" && pytest)
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
