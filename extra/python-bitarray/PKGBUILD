# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-bitarray
_pkgname=${pkgname#python-}
pkgver=3.2.0
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3b5c206dd7f8918f34d479800d4ad439b7859b021b19dfbc36382b0a0b56cb1a')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  pytest "$PWD/tmp_install/$site_packages"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
