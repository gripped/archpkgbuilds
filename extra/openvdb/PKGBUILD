# Maintainer : Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=openvdb
pkgver=12.0.1
pkgrel=2
pkgdesc='A large suite of tools for the efficient storage and manipulation of sparse volumetric data discretized on three-dimensional grids'
url='https://github.com/AcademySoftwareFoundation/openvdb'
arch=('x86_64')
license=('MPL-2.0')
depends=('boost-libs' 'intel-tbb' 'zlib' 'jemalloc' 'blosc' 'log4cplus' 'imath')
makedepends=('doxygen' 'boost' 'cmake' 'mesa' 'cppunit' 'glfw-x11' 'glu' 'python'
             'python-numpy' 'ninja' 'nanobind')
optdepends=('glfw: for tools'
            'glu: for tools'
            'python-numpy: python module')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/openvdb/archive/v${pkgver}.tar.gz")
sha512sums=('67b859bf77c53e68116faa7915bb6a5a50a8cff10435762890e13348625e8aebdb6661b722017632471648afe31e2f9d4cd2e18456c728192bfd0accd70a40ef')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

  cmake \
    -Bbuild \
    -GNinja \
    -DUSE_IMATH_HALF=ON \
    -DUSE_NUMPY=ON \
    -DUSE_LOG4CPLUS=ON \
    -DNB_DIR=/usr/lib/python${_pyversion}/site-packages/nanobind \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENVDB_BUILD_PYTHON_MODULE=ON \
    -DOPENVDB_BUILD_DOCS=ON \
    -DOPENVDB_BUILD_UNITTESTS=OFF

  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  DESTDIR="${pkgdir}" ninja install
  # Try to workaround FS#72653 for now
  mkdir -p "${pkgdir}"/usr/share/cmake/Modules/
  ln -s /usr/lib/cmake/OpenVDB/{OpenVDBUtils,FindOpenVDB,FindBlosc}.cmake "${pkgdir}"/usr/share/cmake/Modules/
}

# vim:set sw=2 sts=2 et:
