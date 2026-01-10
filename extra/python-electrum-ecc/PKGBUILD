# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-electrum-ecc
pkgver=0.0.6
pkgrel=2
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
sha512sums=('182b938a0120adf5e840a4076ee7ee551c0b6ad8a518db8104be12d5682028486d17565caa06da1e28fc61df343d62fb3f5f4ea8dfb5b641a2d19928624e4091')
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
