# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.3.2
pkgrel=1
pkgdesc='Connection pool for psycopg'
arch=(any)
url='https://www.psycopg.org/psycopg3/'
license=(LGPL-3.0-only)
depends=(python python-psycopg)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=("$_pkgname::git+https://github.com/psycopg/psycopg.git#tag=pool-$pkgver")
sha512sums=('7a03a06a1b1e654f9ed6895b169c26ed80066c81cf1b1915a211d7a9a079425e443f38fdb1532ce764f8ef9a48a4ed62bed7e3446bba5d0b34faebed05801ce0')
b2sums=('61ac01b2461fe0bdf34dc4a09e6c87ab45df4ff7a762945e0baca2d13177e64c6d558f0e0d037ae9f6e355a072fc1273592b3f1585c434cda14d6c2f206cba40')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
