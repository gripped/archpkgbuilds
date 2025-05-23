# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
pkgver=3.18.1
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('eeef91aa30eea6ea6d4e1a7cdef7e8c207511ae65455cb0b5f84945c38ac6de3c8e218aa24752e3345d1eb4efcbf20ed289cf764c6fbd631b51be3d5075bc8b7')

prepare() {
  cd ${pkgname#python-}-$pkgver
  # Python 3.13 compatibility
  sed -i 's/isinstance(value, (int, long))/isinstance(value, int)/' \
    playhouse/_sqlite_ext.pyx
}

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
