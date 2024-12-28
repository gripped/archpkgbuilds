# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zodbpickle
_pkgname=${pkgname#python-}
pkgver=4.1.1
pkgrel=3
pkgdesc="Fork of Python's pickle module to work with ZODB"
arch=(x86_64)
url="https://github.com/zopefoundation/zodbpickle"
license=('PSF-2.0 AND ZPL-2.1')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-tests'
  'python-zope-testrunner'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0c9df3b284dccd5fd09d22bfd61e3376e6bfda5b812f98abf5ed78cd191032af')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  zope-testrunner --test-path=src -vc
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
