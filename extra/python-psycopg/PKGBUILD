# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.6
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=('x86_64')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=(
  'python'
  'postgresql-libs'
)
makedepends=(
  'git'
  'cython'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver")
sha512sums=('cf23618e5ee1374b7087a1405ae68edfc1fe04acd068061adaf76ad68451d740d08bbe9d6503c666a663640b1bd612d270506c76a8cf726981194a9710af7767')
b2sums=('a3f36499a14e24f96023e831e4ae41d1b6064dd4b7a51a319ca95ef7bc8d785666f1d1674aab923bd73693cf71a613170d4de3968ee60725fd0e3f13eb119456')

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
