# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sip
pkgver=6.15.0
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
sha256sums=('e15f810c340d3732ce881dacac8b9cd4ce6ee10cf8e5e0bbd465620112293ba5')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
