# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-pycryptodome
pkgver=3.24.1
pkgrel=1
license=('BSD-2-Clause' 'Unlicense')
arch=('x86_64')
pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 3."
url='https://www.pycryptodome.org/'
depends=('python' 'gmp')
makedepends=('git' 'python-'{build,installer,wheel} 'python-setuptools')
conflicts=('python-crypto')
provides=('python-crypto')
replaces=('python-crypto')
source=("git+https://github.com/Legrandin/pycryptodome.git#tag=v$pkgver")
sha512sums=('b297557a761f5ca7b6e3e3de33e69969963fc3e4f976c5e1273f73b1030a6a6d7d1f547b08e91aed6aba1b75b766ce59bd67deb23416c6ff6f10a4f584c6390e')

build() {
  cd pycryptodome
  python -m build -wn

  cd test_vectors
  python -m build -wn
}

check() {
  cd pycryptodome
  python -m installer -d tmpinstall dist/*.whl
  python -m installer -d tmpinstall test_vectors/dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmpinstall/usr/lib/python${python_version}/site-packages" python -m Crypto.SelfTest
}

package() {
  cd pycryptodome
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/

  rm -r "$pkgdir"/usr/lib/python3.*/site-packages/Crypto/SelfTest/
}
