# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=7.1.0
pkgrel=1
pkgdesc='Zope Interfaces for Python 3.x'
arch=('x86_64')
url="https://github.com/zopefoundation/zope.interface"
license=('ZPL-2.1')
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
  'python-zope-event'
  'python-zope-testing'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('57d8ca8891069a8813b0c90f0c8e6fcc6a1a2fd89f4bfa1228214be17984300d2a4a56033d6435d39f1901482dba9195f24ed573a75abe5b72b000cba5e2fde6')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  zope-testrunner --test-path=src -vc
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
