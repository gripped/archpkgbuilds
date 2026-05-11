# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-persistent
pkgver=6.6
pkgrel=1
pkgdesc="Translucent persistent objects"
arch=('x86_64')
license=('ZPL-2.1')
url="https://github.com/zopefoundation/persistent/"
depends=('python-cffi' 'python-zope-interface' 'python-zope-deferredimport')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-zope-testrunner' 'python-manuel')
source=("git+https://github.com/zopefoundation/persistent.git#tag=$pkgver")
sha512sums=('964931ef24a4795b6a2a117a95528d8de04e45c9d55fb5d93eb97a43bf30ae6d858f8da5b28fc03069398c1ca00bdf7b7b9dd78afcd29bedd0065c80b8302d44')

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
