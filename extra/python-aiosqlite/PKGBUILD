# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-aiosqlite
pkgver=0.22.0
pkgrel=1
pkgdesc="Asyncio bridge to the standard sqlite3 module"
arch=(any)
url="https://github.com/omnilib/aiosqlite"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-aiounittest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('80559e2304d6f30f4a3e9a5e8d11eb706468ac723bd4b84c6f3f2771e8e13912')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m unittest discover -v
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
