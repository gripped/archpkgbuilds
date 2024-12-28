# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-aiomysql
_pkgname=${pkgname#python-}
pkgver=0.2.0
pkgrel=3
pkgdesc="Library for accessing a MySQL database from the asyncio"
arch=(any)
url="https://github.com/aio-libs/aiomysql"
license=(MIT)
depends=(
  python
  python-pymysql
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
# checkdepends=(
#   python-docker
#   python-ipdb
#   python-pytest
#   python-sqlalchemy
#   python-uvloop
# )
optdepends=('python-sqlalchemy: SQLAlchemy support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5581db0b209972fec4a0fe861af5081c42bfeca2d4350948bc13fd1ccaf301be')

_archive=$_pkgname-$pkgver

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

# Tests require a running MySQL instance.
# check() {
#   cd "$_archive"
#
#   pytest
# }

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
