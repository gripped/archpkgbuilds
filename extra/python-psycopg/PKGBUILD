# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.7
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
sha512sums=('763525f0ac8cbb0bf43f959a24146d1dd9e41557d4d4c7ca5f8e8ad425622e4e3c47d40e2ad287836158dd33beabd1e9e23192ab037d17f38a9723fd37400158'
            'ed8107454e0384003a2108a985f9f573b635c0838b9c45d91b67dd4c1578bdbdceb54f1ffaf17a323a83ac454d2f8e6f72e24ef58367c9175891212c70470b39')
b2sums=('113efe1f17409d9059aea8a651f3ffa375381a44c966b77a15ad750e3ecb3370d4a626412f14d9646fe36ffe2178299d8c468167e3dc7289831d7d8ad78c199c'
        'acd2b3e276efca144d6602116670fcc062fbb079b717ff9bfc32412c4850892f88af9f7c51b8bc5835338210a71ffa26bb0841ea48a4a505cd9ec054248724a7')

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
