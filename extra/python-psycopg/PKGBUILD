# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.1
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=(x86_64)
url='https://www.psycopg.org/psycopg3/'
license=(LGPL-3.0-only)
depends=(
  python
  postgresql-libs
)
makedepends=(
  git
  cython
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-pytest python-pytest-asyncio)
source=(
  "$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver"
  remove-version-constraint.patch
)
sha512sums=('b229f8e0364305b862627e71f2bcf66223e2012a9a02849250d068129c20ee959fddf61a653a9f943eec9b9b1835cc7cc0c166aaef87f408e0c7094af92cd09c'
            '0ee13cc43647d1e251ef60b32ba32b68e653a0ab07ecbaff650852ac5c654c6a1807aaedb55b555d078b7813ed719c4669d4ffd974c92ba1355f2d675a530277')
b2sums=('37a0fd46465a2fa819e9e1f9ba286cc4dbe4d2ca7c5e6da65544b707eb82eb21d215c14016c909ecb2ba2324c49fa3c98ec77fc246be07f9cb8cbdeb60e07126'
        'c1019eae90c4ce57e23186dfe21d20ed187a1465106140e0256440bd44913a2ee307189d8fcce301e3dedb9d747c4502b9ec8f11bf2ff26fa26416c71a0045a1')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraint.patch"
}

build(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m build --wheel --no-isolation
    popd
  done
}

package(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    popd
  done
}
