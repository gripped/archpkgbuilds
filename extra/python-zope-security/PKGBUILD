# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-security
_pkgname=zope.security
pkgver=8.0
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
  'git'
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
source=("git+https://github.com/zopefoundation/zope.security.git#tag=$pkgver")
sha512sums=('3f3bfe6f62e026513a39aaf0299790518363bc9169360f61b26649feda551831573f7696fc1fdca990c005b5cfdfbae4b59aa1d7c48b8c8e5cdba3b2123d743c')

prepare() {
  cd $_pkgname
  sed -i 's/setuptools == 78.1.1/setuptools/' pyproject.toml
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" \
    zope-testrunner --test-path=src
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
