# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.11
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
source=("$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver")
sha512sums=('9fd4f7fae927667827834d34c9fb588dd875f1856afaaf0d40e5a5466cd27c9eb52f983ae64ca64049b1d1e1d7c4a3fd781112c21dbc995f2c6420e387e9b129')
b2sums=('eeec15fa492330e0a8b5ae0d1e6ab3689f06bd21ba9e92d07a0db4fcbb5f5bdce3ef03046b7e937ee7cf18b51e89a97456e8455d4d1f619c215a7c3b23e094aa')

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
