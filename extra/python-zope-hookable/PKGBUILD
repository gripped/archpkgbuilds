# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-hookable
_pkgname=zope.hookable
pkgver=8.3
pkgrel=1
pkgdesc="Represents the core of the Zope hookable Architecture"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.hookable"
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
checkdepends=('python-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('80ed58c6a3ccac968bed30b1f2ebe3cc7337530b9f0d1b9904878e37007974ad2d955066760ca996266a93fb42f0f27be10b4ca8a21b3dcb72154d0addecba40')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
