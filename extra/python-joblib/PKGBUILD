# Maintainer:  Torsten Keßler <tpkessler@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-joblib
pkgver=1.5.2
pkgrel=2
pkgdesc="Set of tools to provide lightweight pipelining in Python"
arch=('any')
url="https://joblib.readthedocs.io/"
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'procps-ng'
  'python-distributed'
  'python-lz4'
  'python-numpy'
  'python-pytest'
  'python-pytest-asyncio'
  'python-threadpoolctl'
)
optdepends=(
  'python-distributed: for dask parallel backend'
  'python-lz4: for compressed serialization'
  'python-numpy: for array manipulation'
  'python-psutil: to mitigate memory leaks in worker processes'
)
source=("https://github.com/joblib/joblib/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('f2b3a3b61c162c310ccb7704a22c3c9ba07c85ef2058eeeefd0e87e68c094f353085cbbaa212e486ccfcbbd331b7adbf8ad6e4ce051484845d1406d5f40e661f')

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-${pkgver}
  pytest \
    --deselect joblib/test/test_memory.py::test_parallel_call_cached_function_defined_in_jupyter
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
