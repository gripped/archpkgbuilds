# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sip
pkgver=6.8.5
pkgrel=1
arch=(any)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/'
license=('custom:"sip"')
depends=(python
         python-packaging
         python-setuptools)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/Python-SIP/sip#tag=$pkgver)
sha256sums=('78db2e263c1113ac047b7f0a434430bf48a8e892d40e6d68817d2dc9ae93b9d3')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
