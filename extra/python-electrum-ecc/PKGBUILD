# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-electrum-ecc
pkgver=0.0.5
pkgrel=1
pkgdesc="Python library for libsecp256k1, using ctypes"
arch=('any')
url="https://github.com/spesmilo/electrum-ecc"
license=('MIT')
depends=(
  'libsecp256k1'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver?signed")
sha512sums=('e2732d81b1197108d8d7cd8f0150cbedc330397a9ee4678e64c3f8b5db0fb87527fd4b7dea01daf2334a035a7769173c359ddd877f3ee82251ba2e8d03343b42')
validpgpkeys=('4AD64339DFA05E20B3F6AD51E7B748CDAF5E5ED9') # SomberNight <somber.night@protonmail.com>

build() {
  cd ${pkgname#python-}
  export ELECTRUM_ECC_DONT_COMPILE=1
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
