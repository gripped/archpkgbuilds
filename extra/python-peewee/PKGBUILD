# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
pkgver=3.17.9
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
sha512sums=('7082b0abcdaf47ee7b50066773c8491bebc94502b875a0f2a01f6d8d251fd147c738362021ab1d45dbc8ddc73fd7a37c0bc2732623d0f4b3e5d314caea7da510')

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
