# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
pkgver=4.0.3
pkgrel=1
pkgdesc="A small, expressive orm"
arch=('x86_64')
url="https://github.com/coleifer/peewee"
license=('MIT')
depends=(
  'glibc'
  'python'
  'sqlite'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-aiosqlite'
  'python-apsw'
  'python-flask'
  'python-gevent'
  'python-greenlet'
  'python-psycopg2'
)
optdepends=(
  'python-aiomysql: for async MySQL database support'
  'python-aiosqlite: for async SQLite database support'
  'python-apsw: for APSW SQLite database support'
  'python-asyncpg: for async PostgreSQL database support'
  # 'python-cysqlite: for Cython SQLite database support' # not packaged
  'python-flask: for Flask integration utilities'
  'python-gevent: for green-thread based async support'
  'python-greenlet: for async database support'
  'python-psycopg2: for PostgreSQL database support'
  'python-psycopg: for PostgreSQL database support via psycopg3'
  'python-pymysql: for MySQL database support'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('3abbf959cfa0a52199f4575d607013d08d9dbdd7b4a08bb27bd379fa195e9c390c0e3e2c9b2b7a71e1c7b9c2f81a7ef90514ad5656abc75348f12a7858d302aa')

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
