# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-pyicu
pkgver=2.16.1
pkgrel=1
pkgdesc="Python binding for ICU"
arch=('x86_64')
license=('MIT')
url="http://pyicu.osafoundation.org/"
depends=('python' 'icu')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-fonttools' 'python-pytest' 'python-six')
source=("https://pypi.io/packages/source/p/pyicu/pyicu-$pkgver.tar.gz")
sha512sums=('f45044d02b31b56082767ec256d793a47fd4420f9b2974d739c8b56a82b0d5c273440830b11f5afbf0798b1d81ae6b6eeffd1cacee5f969d0587987d34ac68e0')

build() {
  cd pyicu-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyicu-$pkgver
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd pyicu-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
