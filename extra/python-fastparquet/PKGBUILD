# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fastparquet
pkgver=2025.12.0
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('198a061edbbe17be5d04bb7a394144645b2c5da3eb5c83a079162a0cc979d5153fd899258561701186588883d2322d1e27970dfb54a9455124847fed18e3ec28')

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
