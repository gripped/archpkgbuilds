# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Blackleg <blacklg@openaliasbox.org>
# Contributor: Nidhogg
# Contributor: juantascon

pkgname=python-peewee
pkgver=3.17.8
pkgrel=3
pkgdesc="a little orm"
url="https://github.com/coleifer/peewee/"
arch=('x86_64')
license=('MIT')
depends=('python' 'sqlite')
optdepends=('python-psycopg2: for PostgreSQL database support'
            'python-pymysql: for MySQL database support')
makedepends=('python-build' 'python-installer' 'cython' 'python-setuptools' 'python-wheel')
checkdepends=('python-apsw' 'python-flask' 'python-psycopg2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coleifer/peewee/archive/$pkgver.tar.gz")
sha512sums=('47101679b3624c167c82240b2d9fcd60db362e6960cc1852bc5042022fb1250cf4e58050b39ca309cd0a66019cbcf1c8a8e8b8619e0958f8ec37d7222bfe243f')

build() {
  cd peewee-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd peewee-$pkgver
  python runtests.py
}

package() {
  cd peewee-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
