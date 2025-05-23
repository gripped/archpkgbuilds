# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sip
pkgver=6.11.0
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
sha256sums=('2e031dad9edab9df563dd4c402fc269e304a6e23e4123d3d6223a55ab201d704')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
