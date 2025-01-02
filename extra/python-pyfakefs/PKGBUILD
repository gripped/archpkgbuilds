# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pyfakefs
pkgver=5.7.3
pkgrel=1
pkgdesc='pyfakefs implements a fake file system that mocks the Python file system modules'
url=https://github.com/jmcgeheeiv/pyfakefs/
license=(APACHE)
arch=(any)
depends=(python-pytest)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pandas
  python-xlrd
  python-openpyxl
)
_tag=f921657a70e2f0d6e935c786dfc41adc7c950e4b
source=(git+https://github.com/jmcgeheeiv/pyfakefs.git#tag=${_tag})
b2sums=('c2db944bd903ea7377dee461f273bee5557c89e3ee7f08938413fcabdbc5e9a300d5597628a3b2b82e230dbcaca5532ef6f3052949e36de674c8a2008edf34e9')

pkgver() {
  cd pyfakefs
  git describe --tags | sed 's/^v//'
}

build() {
  cd  pyfakefs
  python -m build --wheel --no-isolation
}

check() {
  cd  pyfakefs
  python -m pyfakefs.tests.all_tests
  python -m pyfakefs.tests.all_tests_without_extra_packages
  python -m pytest pyfakefs/pytest_tests/pytest_plugin_test.py
}

package() {
  python -m installer --destdir="${pkgdir}" pyfakefs/dist/*.whl
}

# vim: ts=2 sw=2 et:
