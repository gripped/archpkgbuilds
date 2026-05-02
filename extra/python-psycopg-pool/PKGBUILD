# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.3.1
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
sha512sums=('b5ba078e3048d5cda4974390b5cdbd2e4dee049a98bc6195817eba10cd5d805b08a7525cb01f2b6c25f82c2a50b1eb1ff853817b5c0cfe5babb1145000327a9b')
b2sums=('a87550489168b77199561ce943ad681be2b5aa44830e7ee9b58f1b1e4c4d74f0424f1d3934e990730ee4a4d9ad28ece5d421f72fb536d9777c7ac85be3d39573')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
