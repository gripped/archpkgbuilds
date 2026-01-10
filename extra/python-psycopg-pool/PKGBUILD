# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.3.0
pkgrel=2
pkgdesc='Connection pool for psycopg'
arch=('any')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=('python' 'python-psycopg')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$_pkgname::git+https://github.com/psycopg/psycopg.git#tag=pool-$pkgver")
sha512sums=('c2b264dfa7a3aef274773edd8757691bd858fb42efc5c774261f8289ae22f59ba3c12c312547c54a24153bd97f6986fd9c1250a233561b2f0a3ff659bbe8cc79')
b2sums=('f916d76857dfd11cb33f58cb48afd0a1e70ddb4a81244c8c2f1fe027060ad929bb6788aecc558a40e4c01b8eed115184ef44c9131d40f376428b7aa7c1dc53cf')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
