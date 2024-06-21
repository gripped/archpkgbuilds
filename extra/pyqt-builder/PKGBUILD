# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pyqt-builder
pkgver=1.16.3
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
sha256sums=('1d82ccb5932471deb61863dd51c09bce4637825bcbdbbfb163f16ed7ee834db6')

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
