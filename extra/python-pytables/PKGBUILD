# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python-pytables
_pkgname=PyTables
pkgver=3.10.1
pkgrel=2
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
  python-typing_extensions
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
)
sha256sums=('6cb9e63cdd8acab4fab2526d6e6d525a67324d80c6d18e36101f7cb594066b61'
            'SKIP')

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.c-blosc.url "$srcdir/c-blosc"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  mv tables _tables # Required for package installed in tmp_install to take precedence
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" python -m tables.tests.test_all
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
