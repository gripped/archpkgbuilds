# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-kiwisolver
pkgver=1.4.8
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
sha512sums=('e7fdda5d735e64f709c472b20f37c86dd71bd0a3fad0f86d68b0317fe11d5724182e327fd394170ee37c3a914b9fc855452cca3f9ff06c4fe00fe92b88641512')

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
