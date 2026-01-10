# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.2
pkgrel=2
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
sha512sums=('0b6c07b1f00c44e8aa618e2daa92c0884906f13a993c96e3ee186b799f604ee52dfff4cc6298e8438d101152686fc38112f5b8bbf7056f3068d189b56e220e9a'
            '0ee13cc43647d1e251ef60b32ba32b68e653a0ab07ecbaff650852ac5c654c6a1807aaedb55b555d078b7813ed719c4669d4ffd974c92ba1355f2d675a530277')
b2sums=('fa1f1ff8ba4b30d9cf76e474fe1c3441da87f1eeb3e21e537ef175608720bd860c4f8e738deea8123a6889e6d740c3df4bd5e1c7ea2fc10ccd0f6617839d108e'
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
