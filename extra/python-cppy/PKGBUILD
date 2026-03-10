# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cppy
pkgver=1.3.0
pkgrel=1
pkgdesc="A collection of C++ headers which make it easier to write Python C extension modules"
url="https://github.com/nucleic/cppy"
license=('BSD-3-Clause')
arch=('any')
# cppy/__init__.py uses setuptools
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/nucleic/cppy.git#tag=${pkgver}")
sha512sums=('94be626e32573dbd20ce5f0a61acb5a5db9653d86257c9431851adc4fb487120c90a359dcf5c47cfe7f3646a47a703b133bada33500b658158004927277a22ac')

build() {
  cd cppy
  python -m build -wn
}

check() {
  cd cppy
  python -m pytest
}

package() {
  cd cppy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
