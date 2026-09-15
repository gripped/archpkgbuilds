# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-electrum-ecc
pkgver=0.0.7
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
b2sums=('df641ef65ed032831e7d210738c0b4af0d5e5e5edb450f41c993f63828b2e35b829750162a89dc4696e1d2e268501e1a1d8110e0c7e0dca62d37810626c1f647')
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
