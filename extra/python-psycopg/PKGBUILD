# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.9
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
sha512sums=('f9241b9a57e9a035e8aa8e953f55ce03eaec63123a484a466c05e9961a7a760443fab257dcba58b679425655081befaf8aeff9c98a2122bd8b020bf9403498b1'
            '1cd8f204e5fbc4227b87deb1b44a3717ad0a835212a02f95b0a21d2b6d7ca341167f32e5b7cc24a3a11c907261d86acfdf606fad3636d7c872b611fbd47f5e16')
b2sums=('486b027441d3c968e022b96abee9572d69d51ecc29d4eeb1330f41d8c738d3820e9dcbfec9c216b50d5c10a295381a94c41c5205ed2605f3ae6b8de05cfa627c'
        'e4c59715565f4388c3087726762c409d60d2e11eea4065fad20b9e6580d1f5455821f86eb83e60029e2231e68c9662a2726df0de956edc069f82199d2a64c1f9')

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
