# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.4
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=(x86_64)
url='https://www.psycopg.org/psycopg3/'
license=(LGPL-3.0-only)
depends=(
  glibc
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
sha512sums=('b5ba078e3048d5cda4974390b5cdbd2e4dee049a98bc6195817eba10cd5d805b08a7525cb01f2b6c25f82c2a50b1eb1ff853817b5c0cfe5babb1145000327a9b'
            '0ee13cc43647d1e251ef60b32ba32b68e653a0ab07ecbaff650852ac5c654c6a1807aaedb55b555d078b7813ed719c4669d4ffd974c92ba1355f2d675a530277')
b2sums=('a87550489168b77199561ce943ad681be2b5aa44830e7ee9b58f1b1e4c4d74f0424f1d3934e990730ee4a4d9ad28ece5d421f72fb536d9777c7ac85be3d39573'
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
