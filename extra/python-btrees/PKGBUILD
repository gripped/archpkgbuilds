# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-btrees
pkgver=6.4
pkgrel=1
pkgdesc='Scalable persistent object containers'
arch=('x86_64')
license=('ZPL-2.1')
url='https://github.com/zopefoundation/btrees'
depends=('python-persistent' 'python-zope-interface')
makedepends=('git' 'python-setuptools' 'python-build' 'python-wheel' 'python-installer')
checkdepends=('python-transaction' 'python-zope-testrunner')
source=("git+https://github.com/zopefoundation/btrees.git#tag=$pkgver")
sha512sums=('3f13bd40cab213e5fd57d2e9933112145cb8f6d0e2d180c52158c03661868a7e492a15fa91713882f28bf81cf9edffdbc749996afa4de1d45380d7c2d6e9496c')

build() {
  cd btrees
  python -m build --wheel --no-isolation
}

check() {
  cd btrees
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m zope.testrunner --test-path=src
}

package() {
  cd btrees
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
