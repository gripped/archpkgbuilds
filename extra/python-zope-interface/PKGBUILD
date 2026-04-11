# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=8.3
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
makedepends+=(git)
source=("git+https://github.com/zopefoundation/zope.interface.git#tag=$pkgver")
sha512sums=('a15c867b7e5e39438b7ffc2effd36a2d55169d4ec6ca0907842a5b1d6ecd56ebb31ae67ed60ccc5800c1a436bf94a3a68792b4794774b9c856d320a878a6388f')

build() {
  cd zope.interface
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd zope.interface
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd zope.interface
  python -m installer --destdir="$pkgdir" dist/*.whl
}
