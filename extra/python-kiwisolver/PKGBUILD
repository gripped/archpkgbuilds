# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-kiwisolver
pkgver=1.5.0
pkgrel=1
pkgdesc="A fast implementation of the Cassowary constraint solver"
url="https://github.com/nucleic/kiwi"
license=('BSD-3-Clause')
arch=('x86_64')
depends=('python')
makedepends=('git' 'python-cppy' 'python-setuptools-scm' 'python-wheel' 'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/nucleic/kiwi.git#tag=$pkgver")
sha512sums=('834fa06778532a3eedc0f67f225b38d30027dc38d1ab9426fe9e3bb2efcaf469df60e6466022c8f2786f75113719023a50fef85b744fdc9c823d315b39e36785')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
