# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.9
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
sha512sums=('30d3d0f5a952e9c666c1dc573146b94c23c20093f8f063b746d67476c4be470b1d821220b9970b5b63b2ddaaee36791d7929d8a380d805c6b6c6353f3c4b0ca5')
b2sums=('f034ade2fc4e372ce78a0e26e9a4ba9a43992c0b84d9c83c5b0037ae9c10747a990b90375618e30c470449e2e475a405d8d0c1f3c0944451026801ee74429e5d')

prepare() {
  cd "$pkgname"

  # revert version constraint for Cython (issue fixed in Cython 3.1.2 release)
  # https://github.com/tianhm/cython/commit/e466fe29ad545ca4a459be9679ab1842c38c1c64
  git revert --no-commit 91daf1bd3e6d28b8bc8a9c3860654429a76cd17a
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
