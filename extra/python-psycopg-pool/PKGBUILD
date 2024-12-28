# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.2.4
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
sha512sums=('64376ab7b4e4c406179ef9a2501cabb048af8c9a33171d7157e550c86fd1cbed5e6dc928f9274199c51b8f035018ac6912fd140a42a4afd3dbe9369d87588b4f')
b2sums=('bd2dfa870a4c6fcfc3ec2675bf87944530a5138ea43ffa9ea1306cb97da144a0ff3533f5f5884ca7bfc8b99bf56b0c4015e42237fafd334fc32da9a6b7475f4d')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
