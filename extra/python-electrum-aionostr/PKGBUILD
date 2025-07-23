# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-electrum-aionostr
pkgver=0.0.11
pkgrel=1
pkgdesc="Asyncio nostr client for Python"
arch=('any')
url="https://github.com/spesmilo/electrum-aionostr"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-aiohttp'
  'python-aiohttp-socks'
  'python-aiorpcx'
  'python-cryptography'
  'python-electrum-ecc'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-click'
  'python-pytest'
)
optdepends=('python-click: for command line interface')
source=("git+$url.git#tag=$pkgver?signed")
sha512sums=('c6de0fd510aaf04e3daee540e263faa64e6fb19aab00411cca25aa1fe2ee15cf98186192683e42b131d9af19d7a430db5929037a54aea0ff4c64a9dcb5ae5b7f')
validpgpkeys=('4AD64339DFA05E20B3F6AD51E7B748CDAF5E5ED9') # SomberNight <somber.night@protonmail.com>

build() {
  cd ${pkgname#python-}
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
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
