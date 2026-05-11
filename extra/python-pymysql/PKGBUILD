# Maintainer: David Runge <dvzrv@archlinux.org>

_name=PyMySQL
pkgname=python-pymysql
pkgver=1.1.3
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL/"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# NOTE: tests require a running instance of mariadb
optdepends=(
  'mariadb: for using a local MariaDB instance'
  'python-cryptography: for RSA cryptography'
  'python-pynacl: for ed25519 cryptography'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('7e16e7c93b239fdcacfdac4ddc19c4dbfdc084ae541ae4fd4b2b2c1bfba52c52b43860243aaaf2960068c6409de9da9456a0cae1768630ac518ab387d9491192')
b2sums=('17be122beca17b4145b1587bd5f737f4093fce552f615381f84f586293980bf7abfb9dd4c26aef3d026f30238de5091ba6bc40b9d8bba7376d8956695f2c6d09')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
