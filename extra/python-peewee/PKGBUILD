# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
_pkgname=${pkgname#python-}
pkgver=3.17.8
pkgrel=4
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
  'python-apsw'
  'python-flask'
  'python-gevent'
  'python-psycopg2'
)
optdepends=(
  'python-psycopg2: for PostgreSQL database support'
  'python-pymysql: for MySQL database support'
)
source=("$url/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('47101679b3624c167c82240b2d9fcd60db362e6960cc1852bc5042022fb1250cf4e58050b39ca309cd0a66019cbcf1c8a8e8b8619e0958f8ec37d7222bfe243f')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m unittest discover -v
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
