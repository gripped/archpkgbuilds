# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-persistent
pkgver=6.7
pkgrel=1
pkgdesc="Translucent persistent objects"
arch=('x86_64')
license=('ZPL-2.1')
url="https://github.com/zopefoundation/persistent/"
depends=('python-cffi' 'python-zope-interface' 'python-zope-deferredimport')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-zope-testrunner' 'python-manuel')
source=("git+https://github.com/zopefoundation/persistent.git#tag=$pkgver")
sha512sums=('1318773a830fa4714af362592222a945dc491dd59a3e2ab25bc876df92ea7a74834191e0f4f8504136932a64e2ecda7056ff9a281677b544d26cea8f9135c229')

build() {
  cd persistent
  python -m build --wheel --no-isolation
}

check() {
  cd persistent
  local builddir=(build/lib.*)
  PYTHONPATH="$PWD/${builddir[0]}" python -m zope.testrunner --test-path=src
}

package() {
  cd persistent
  python -m installer --destdir="$pkgdir" dist/*.whl
}
