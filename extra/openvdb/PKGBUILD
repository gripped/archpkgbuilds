#Maintainer : Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=openvdb
pkgver=10.1.0
pkgrel=1
pkgdesc='A large suite of tools for the efficient storage and manipulation of sparse volumetric data discretized on three-dimensional grids'
url='https://github.com/dreamworksanimation/openvdb'
arch=('x86_64')
license=('MPL')
depends=('boost-libs' 'intel-tbb' 'zlib' 'jemalloc' 'blosc' 'log4cplus')
makedepends=('doxygen' 'boost' 'cmake' 'mesa' 'cppunit' 'glfw-x11' 'glu' 'python'
             'python-numpy' 'ninja' 'pybind11')
optdepends=('glfw: for tools'
            'glu: for tools'
            'python-numpy: python module')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/openvdb/archive/v${pkgver}.tar.gz")
sha512sums=('b1f36fb53ed9fcc65a59a764bb79b7bd0f8469649a70051023f9a8f5d2692f6c32a53c62fc78b7ab57ebda7dedea7b32450b62d90107119f5a30179a660536aa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -Bbuild \
    -GNinja \
    -DUSE_NUMPY=ON \
    -DUSE_LOG4CPLUS=ON \
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
