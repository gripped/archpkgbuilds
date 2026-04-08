# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-bitarray
pkgver=3.8.1
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
b2sums=('72aa18c72ed1f4254a1e120c4a8d1ee7bbb50a5b7927ea499c94bcca6222e20fc53a58e5d55fd6a8671e980b430d0acaa08cc99c9cd48e94325f47e7f816de9f')

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
