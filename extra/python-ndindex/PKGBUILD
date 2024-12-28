# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-ndindex
_pkgname=${pkgname#python-}
pkgver=1.9.2
pkgrel=2
pkgdesc="Library for manipulating indices of ndarrays"
arch=(x86_64)
url="https://quansight-labs.github.io/ndindex/"
license=(MIT)
depends=(
  glibc
  python
  python-numpy
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-versioneer
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
  python-sympy
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Quansight-Labs/ndindex/archive/$pkgver/$pkgver.tar.gz")
sha256sums=('da61bdedaacc23b34d8e7223888d5f5e50b92e26cd41b0d79913b366ef9a3257')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$PWD/tmp_install/$site_packages"
  pytest --override-ini="addopts=" -W ignore::pytest.PytestUnknownMarkWarning
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir/$site_packages/ndindex/tests"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
