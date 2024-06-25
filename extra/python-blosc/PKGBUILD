# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-blosc
pkgver=1.11.1
pkgrel=5
pkgdesc='Python wrapper for the extremely fast Blosc compression library'
arch=('x86_64')
url='https://www.blosc.org/python-blosc/python-blosc.html'
license=('BSD-3-Clause')
depends=('python' 'blosc')
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-scikit-build'
  'python-py-cpuinfo'
)
checkdepends=('python-numpy' 'python-psutil')
optdepends=('python-numpy: for tests and benchmarks')
source=("https://github.com/Blosc/python-blosc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('21f8a697a3a902860a6ed72233984cf00c464ec0ddde9842a0c24b1e8e5ec4dd57b872096445a873d162d7529cba5c3666ba2a3ee3f9b1b18107d9636011281c')
b2sums=('cb348253a24258d2649ebc0604acbf936b8ccc2b28c42c69da2fee72ddf87eb17a24657bc5d3c0530193a60f482555ce4cc5d168a18d9c2d79a13410d40670bc')

build() {
  cd "${pkgname}-${pkgver}"

  # AVX2 disabled because Arch does not have x86_64_v3 yet.
  # Snappy is also disabled by default for compatability with non-C++ systems.
  export CMAKE_ARGS="\
    -DCMAKE_C_FLAGS_INIT=-DNDEBUG \
    -DCMAKE_BUILD_TYPE=None \
    -DUSE_SYSTEM_BLOSC=ON \
    -DDEACTIVATE_SNAPPY=OFF \
    -DDEACTIVATE_AVX2=ON"

  # skip unnecessary dependencies (ninja, cmake, etc)
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${pkgname}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m blosc.test
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
