# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-propcache
pkgver=0.5.2
pkgrel=1
pkgdesc='Fast property caching'
arch=(x86_64)
url='https://github.com/aio-libs/propcache'
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  cython
  python-build
  python-expandvars
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/v$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha512sums=('9793c89695f1631f0b7c0076a1efffb0adfe9e83e7899e45b968afe9e00bcb721c88eed0b712570d81b25571cc6b0745a79b2e23f345fdd7ddc991fdfa4b3731')

prepare() {
  cd ${pkgname#python-}-$pkgver
  # Drop Cython versioned requirement
  sed -i 's/ ~= 3.1.0//' packaging/pep517_backend/_backend.py
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
