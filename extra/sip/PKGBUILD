# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sip
pkgver=6.9.0
pkgrel=1
arch=(any)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/'
license=(BSD-2-Clause)
depends=(python
         python-packaging
         python-setuptools)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/Python-SIP/sip#tag=$pkgver)
sha256sums=('aded42c2cfbbf9fe69cee474ef8c04b14e0fb6ce4ab5b7ac26911e783bd3b4eb')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
