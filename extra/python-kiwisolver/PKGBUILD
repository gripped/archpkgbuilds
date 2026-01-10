# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-kiwisolver
pkgver=1.4.7
pkgrel=2
pkgdesc="A fast implementation of the Cassowary constraint solver"
url="https://github.com/nucleic/kiwi"
license=('BSD-3-Clause')
arch=('x86_64')
depends=('python')
makedepends=('git' 'python-cppy' 'python-setuptools-scm' 'python-wheel' 'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/nucleic/kiwi.git#tag=$pkgver")
sha512sums=('046792480dd0fab072f1d2d4e9f7060386159ba75b2a51e2045eb93d98ca18c1b238ba54539213ce22cb8174c4a771b8fd72a5a5e65f64182758fba994645835')

build() {
  cd kiwi
  python -m build --wheel --no-isolation
}

check() {
  cd kiwi
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd kiwi
  python -m installer --destdir="$pkgdir" dist/*.whl
}
