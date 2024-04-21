# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pyqt-builder
pkgver=1.16.1
pkgrel=1
pkgdesc='The PEP 517 compliant PyQt build system'
arch=(any)
url='https://pypi.org/project/PyQt-builder/'
license=(BSD-2-Clause)
depends=(python
         python-packaging
         sip)
makedepends=(python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(https://github.com/Python-PyQt/PyQt-builder/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9032e622f88c1b65ad75e7a768106cbb0bf2ed71795eb089be418f48b3605cfa')

build() {
  cd PyQt-builder-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

package() {
  cd PyQt-builder-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
