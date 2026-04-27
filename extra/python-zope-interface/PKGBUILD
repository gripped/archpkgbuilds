# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=8.4
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
sha512sums=('84e9e44fd3467fca5a8d0b7e3f6375150088df7a8bfe3d51f55396394123c9c3e3d1afcd31262e00c5e1d0e604d288c1797bd4a60a824a73baf772c53dcb356e')

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
