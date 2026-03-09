# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=python-pyasn1
pkgdesc="ASN.1 library for Python 3"
pkgver=0.6.2
pkgrel=1
arch=('any')
url="https://github.com/pyasn1/pyasn1"
license=('BSD-2-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
replaces=('pyasn1')
provides=('pyasn1')
source=("git+https://github.com/pyasn1/pyasn1.git#tag=v$pkgver")
sha512sums=('0e0d720119ad0b69e7da0aee21fbed5d7fc89b73a07085a0d5082f3ad6cf91bd96190daaf5d0bad36c6d69412b992486a585e3815b1708acdfbf61a7cd9cb037')

build() {
  cd pyasn1
  python -m build -nw
}

check() {
  cd pyasn1
  python -m unittest discover -s tests
}

package() {
  cd pyasn1
  python -m installer -d "$pkgdir" dist/*.whl

  # Symlink license file
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
