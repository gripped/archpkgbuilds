# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-persistent
pkgver=6.9
pkgrel=1
pkgdesc="Translucent persistent objects"
arch=('x86_64')
license=('ZPL-2.1')
url="https://github.com/zopefoundation/persistent/"
depends=('python-cffi' 'python-zope-interface' 'python-zope-deferredimport')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-zope-testrunner' 'python-manuel')
source=("git+https://github.com/zopefoundation/persistent.git#tag=$pkgver")
sha512sums=('9e490c2910747ff9b883b5c94580327ba7a364d7d61e8580682c3fe7d5f49f62375272c95e9a8628ad97ab6948b0d77c499275cec9f7a1e33c230afbe3657d59')

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
