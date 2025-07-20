# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-compute-runtime
pkgver=25.27.34303.5
pkgrel=1
pkgdesc="Intel(R) Graphics Compute Runtime for oneAPI Level Zero and OpenCL(TM) Driver"
arch=(x86_64)
url="https://01.org/compute-runtime"
license=(MIT)
depends=(
  gcc-libs
  glibc
  intel-gmmlib
  intel-graphics-compiler)
makedepends=(
  cmake
  igsc
  level-zero-headers
  libva)
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=(opencl-driver level-zero-driver)
# https://github.com/intel/compute-runtime/issues/528
options=(!lto)
source=(https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        010-intel-compute-runtime-disable-werror.patch)
sha256sums=('c9c0a2cabc902405a5f14094e57da16ab9ef202cacab00bfe81c0b7c6a662606'
            'fbc3c652c2a5edd22b7b9134679f8ce98ef6c4726ee18b555d1787054c2205f3')

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

  # opencl-headers supported by upstream is already in the source tree
  # https://github.com/intel/compute-runtime/blob/25.09.32961.5/third_party/opencl_headers/.version#L2
  local _opencl_headers_dir="${srcdir}/compute-runtime-${pkgver}/third_party/opencl_headers"
  export CXXFLAGS+=" -isystem${_opencl_headers_dir}"

  # tests currently disabled because of https://github.com/intel/compute-runtime/issues/599
  cmake -B build -S compute-runtime-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DNEO_BUILD_UNVERSIONED_OCLOC=ON \
    -DNEO_DISABLE_LD_GOLD:BOOL=ON \
    -DNEO_OCL_VERSION_MAJOR=${pkgver%%.*} \
    -DNEO_OCL_VERSION_MINOR=$(echo ${pkgver} | cut -d . -f2) \
    -DNEO_VERSION_BUILD=$(echo ${pkgver} | cut -d . -f3) \
    -DSUPPORT_DG1=ON \
    -DSUPPORT_DG2=ON \
    -DKHRONOS_GL_HEADERS_DIR=/usr/include \
    -DKHRONOS_HEADERS_DIR="${_opencl_headers_dir}" \
    -DSKIP_UNIT_TESTS=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 compute-runtime-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}

  ln -s $(find "${pkgdir}"/usr/lib -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;) "${pkgdir}"/usr/lib/libze_intel_gpu.so
}
