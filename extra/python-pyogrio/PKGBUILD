# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=pyogrio
pkgname=python-${_pkg}
pkgver=0.8.0
pkgrel=1
pkgdesc="Vectorized vector I/O using OGR"
arch=(x86_64)
url="https://pyogrio.readthedocs.io/"
license=(MIT)
depends=(gdal python-certifi python-numpy)
makedepends=(cython python-build python-installer python-setuptools python-versioneer python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('459ec590c3c1cda451f3f73c88a678c32b127de783bf54c41ea6ad708969f020')

prepare() {
  sed -e '/oldest-supported-numpy/d' -e '/versioneer\[toml\]==0.28/d' \
    -i ${_pkg}-${pkgver}/pyproject.toml
}

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

# ModuleNotFoundError: No module named 'pyogrio._ogr' even when setting PYTHONPATH or using a venv
#check() {
#  cd ${_pkg}-${pkgver}
#  pytest -vv --color=yes
#}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
