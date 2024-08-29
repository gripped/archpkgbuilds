# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-security
_pkgname=zope.security
pkgver=7.1
pkgrel=1
pkgdesc="Zope Security Framework"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.security"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-component'
  'python-zope-i18nmessageid'
  'python-zope-interface'
  'python-zope-location'
  'python-zope-proxy'
  'python-zope-schema'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-btrees'
  'python-zope-configuration'
  'python-zope-testing'
  'python-zope-testrunner'
)
optdepends=('python-zope-configuration: for ZCML support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('606f4f092947e7ac5d941d351f356760c7d0c8d60765569728994fe005ad55ec13fba8da41566058ff1969bff1fc813cfa75c8579fc2ca8194d50eb4acc5e6b7')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" \
    zope-testrunner --test-path=src
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
