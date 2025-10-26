# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.2.7
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
sha512sums=('08e3bff4db176e0900927dd0cd080478819671614109fe36d3ef052af878463a524ff2223aebc1afdf67e9d4983d14bc8b19675ab918b0d344c820928e97e081')
b2sums=('739956eebad5e0635207315a14b5062539e8c0b6f3ae3fed2315076f6ccd1a831965f24fcc124576d227b1f9214397e81e6ae4438b9780af6e4ea1e2eb0164fa')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
