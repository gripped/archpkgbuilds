# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-proxy
_pkgname=zope.proxy
pkgver=5.3
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
sha512sums=('13bd9b73732747583e9385601896fdfd87f06b8ae27628ca179ab6df0846f04f9a7af785ed31083a930cbe837e465aa7254de9206110f49d3ea351df5f260e7a')

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
