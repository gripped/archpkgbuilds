# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fastparquet
pkgver=2024.11.0
pkgrel=3
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
b2sums=('7836a8e1bfdc67095d2c9f1e7eb5ad4063628209d8c1a0a9fedf942d6c0c57cfb179c3fc835bd54f5391b43f051d7afe0b472cff5d53019603cf14ea4006ccc2')

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
