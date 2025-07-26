# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-bitarray
pkgver=3.5.2
pkgrel=1
pkgdesc="Efficient arrays of booleans for Python"
arch=(x86_64)
url="https://github.com/ilanschnell/bitarray"
license=(PSF-2.0)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('3a8bdf36e009a31568aab9fb49d195b3dc9dceba30ac9233fa1622641db84ae6')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  pytest "$PWD/tmp_install/$site_packages"
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
