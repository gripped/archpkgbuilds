# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python-pytables
_pkgname=PyTables
pkgver=3.10.2
pkgrel=6
pkgdesc="A Python package to manage extremely large amounts of data"
arch=(x86_64)
url="https://www.pytables.org"
license=(BSD-3-Clause)
depends=(
  blosc2
  bzip2
  glibc
  hdf5
  lzo
  python
  python-numexpr
  python-numpy
  python-packaging
  python-py-cpuinfo
)
makedepends=(
  cython
  git
  python-blosc2
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "git+https://github.com/PyTables/PyTables.git#tag=v$pkgver"
  "git+https://github.com/Blosc/c-blosc.git"
  "git+https://github.com/Blosc/hdf5-blosc.git"
)
sha256sums=('095274ffa1dcc0835c4eb435ddff6e52ed2f8b893db3607390e785a04577fefc'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.c-blosc.url "$srcdir/c-blosc"
  git config submodule.hdf5-blosc.url "$srcdir/hdf5-blosc"
  git -c protocol.file.allow=always submodule update

  # Fix python-numexpr 2.13+ compatibility
  git cherry-pick -n 41270019ce1ffd97ce8f23b21d635e00e12b0ccb
}

build() {
  cd $_pkgname
  export CFLAGS="$CFLAGS -std=gnu11"
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm tables.tests.test_all
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
