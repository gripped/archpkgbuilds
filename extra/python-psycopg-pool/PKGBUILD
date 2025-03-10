# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.2.6
pkgrel=1
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
sha512sums=('1370d6dab5e7fae5e5d6ef9c06c67d3429f667e04f1519cc928934762d3bf8bc3b6ea6a7b34fa32613fa915b5a8f4f409aafbc904791197d6375b40cddec6e1e')
b2sums=('6b64d264a0c6a4c451b4df1dae669e5ac527dceb7c5eda17f62a33cde3eb5f0c1577e422acc01ab7b73fc8d35815ef54c34cf01e4f0fa2e1eacae289eb9f166e')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
