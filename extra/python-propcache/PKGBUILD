# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-propcache
pkgver=0.3.1
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
sha512sums=('5909d348537aadea28a56fac0330e2469dd6bb0e86410f548e39578656dcaf2c82aa86759abaa84c244e6f9f2f000e849b914c994ad0367908bac099ca3194f7')

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
