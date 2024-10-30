# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-compute-runtime
pkgver=24.39.31294.12
pkgrel=1
pkgdesc="Intel(R) Graphics Compute Runtime for oneAPI Level Zero and OpenCL(TM) Driver"
arch=(x86_64)
url="https://01.org/compute-runtime"
license=(MIT)
depends=(gcc-libs intel-gmmlib intel-graphics-compiler)
makedepends=(cmake igsc libva level-zero-headers opencl-headers)
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=(opencl-driver level-zero-driver)
# https://github.com/intel/compute-runtime/issues/528
options=(!lto)
source=(https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        010-intel-compute-runtime-disable-werror.patch)
sha256sums=('894682b5463f0400a907ddb8fb46bbfbfe92b40c79a16d3b0a23cba4ad5df4b2'
            '0b28144cb237672f1b806e370ac902e63b9fc85c5e7b25ed610ffd31c2d725bf')

prepare() {
  patch -d compute-runtime-${pkgver} -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
}

build() {
  # ${${pkgver#*.}%.*} not supported by bash?
  # Fix runtime error in blender
  CXXFLAGS+=' -DSANITIZER_BUILD=1'
  CFLAGS+=' -DSANITIZER_BUILD=1'
  
  # fix warning: "_FORTIFY_SOURCE" redefined
  # note: upstream forces _FORTIFY_SOURCE=2
  export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
  
  # tests currently disabled because of https://github.com/intel/compute-runtime/issues/599
  cmake -B build -S compute-runtime-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DNEO_DISABLE_LD_GOLD:BOOL=ON \
    -DNEO_OCL_VERSION_MAJOR=${pkgver%%.*} \
    -DNEO_OCL_VERSION_MINOR=$(echo ${pkgver} | cut -d . -f2) \
    -DNEO_VERSION_BUILD=$(echo ${pkgver} | cut -d . -f3) \
    -DSUPPORT_DG1=ON \
    -DSUPPORT_DG2=ON \
    -DKHRONOS_GL_HEADERS_DIR=/usr/include \
    -DKHRONOS_HEADERS_DIR=/usr/include \
    -DSKIP_UNIT_TESTS=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 compute-runtime-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}
  
  ln -s $(find "${pkgdir}"/usr/lib -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;) "${pkgdir}"/usr/lib/libze_intel_gpu.so
  ln -s $(find "${pkgdir}"/usr/bin -name 'ocloc-*' -exec basename {} \;) "${pkgdir}"/usr/bin/ocloc
}
