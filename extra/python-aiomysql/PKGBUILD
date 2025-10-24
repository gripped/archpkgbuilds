# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-aiomysql
pkgver=0.3.2
pkgrel=1
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
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f9c218491e7356ffb2d9f2f1c19c86147f20f88cac5b86962e84e40e2a6d5260')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

# Tests require a running MySQL instance.
# check() {
#   cd ${pkgname#python-}-$pkgver
#   pytest
# }

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
