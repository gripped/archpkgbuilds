# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pyqt-builder
pkgver=1.17.1
pkgrel=1
pkgdesc='The PEP 517 compliant PyQt build system'
arch=(any)
url='https://pypi.org/project/PyQt-builder/'
license=(BSD-2-Clause)
depends=(python
         python-packaging
         sip)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/Python-PyQt/PyQt-builder#tag=$pkgver)
sha256sums=('f4fa3730342de0746c704bc6d7fd3e77b5c0307f30517300f446013838cb1020')

build() {
  cd PyQt-builder
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

package() {
  cd PyQt-builder
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
