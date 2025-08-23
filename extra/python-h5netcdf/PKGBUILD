# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-h5netcdf
pkgver=1.6.4
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/h5netcdf/h5netcdf"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-h5py'
  'python-numpy'
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-netcdf4'
  'python-pytest'
)
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-exclude-tests.patch"
)
sha256sums=('c8ffcc59751ffc6e31c263f6581c583a90f7e7465884aa1cae7cb8cc3e621aeb'
            '9d8580e5fed17e7ff8f1032d28ca0e307eeec2fc979f13e9017540e66e402695')

prepare() {
  cd ${pkgname#python-}-$pkgver
  patch -Np1 < ../$pkgname-exclude-tests.patch
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
