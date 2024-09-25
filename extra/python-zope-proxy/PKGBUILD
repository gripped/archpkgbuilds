# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-proxy
_pkgname=zope.proxy
pkgver=6.0
pkgrel=1
pkgdesc="Generic Transparent Proxies"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.proxy"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-security'
  'python-zope-testrunner'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b72ba4cd5893fcf5af484088d8e03d80e1695a04589c6d92c73ec148189c6461e3137b6081de479392ef99278598151c6d468a48aeb780664784e40fd9f3325a')

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
