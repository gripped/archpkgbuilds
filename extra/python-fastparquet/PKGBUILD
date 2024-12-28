# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fastparquet
_pkgname=${pkgname#python-}
pkgver=2024.11.0
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('312c2252bc2a5507430561efeb7e574035da70fbe16cb894f9cf0abda4392dfa')

build() {
  cd "$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -r fastparquet/test test-data "$PWD/tmp_install/$site_packages"
  (cd "$PWD/tmp_install/$site_packages" && pytest)
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
