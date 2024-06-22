# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python-pytables
pkgver=3.9.2
pkgrel=4
pkgdesc="A package for managing hierarchical datasets and designed to efficiently and easily cope with extremely large amounts of data"
arch=(x86_64)
url="https://www.pytables.org"
license=('BSD-3-Clause')
depends=(blosc blosc2 lzo hdf5 python-numexpr python-blosc2)
makedepends=(python-setuptools python-wheel python-build python-installer cython)
source=(https://github.com/PyTables/PyTables/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('4d7f2fc77fc63c95aaed2f8b8bf6cfbbdc7d52607b2112a80bf330c53b6c9838')

prepare() {
  sed -i '/oldest-supported-numpy/d' PyTables-${pkgver}/pyproject.toml
}

build() {
  cd PyTables-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd PyTables-${pkgver}/build/lib.linux-${CARCH}-cpython-${python_version}
  PYTHONPATH="." python -m tables.tests.test_all
}

package() {
  cd PyTables-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
