# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-compute-runtime
pkgver=25.44.36015.5
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for oneAPI Level Zero and OpenCL(TM) Driver'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'intel-gmmlib'
    'intel-graphics-compiler')
makedepends=(
    'cmake'
    'igsc'
    'level-zero-headers'
    'libva')
optdepends=(
    'igsc: for discrete GPU firmware enumeration through Level Zero'
    'libdrm: for cl_intel_va_api_media_sharing OpenCL extension'
    'libva: for cl_intel_va_api_media_sharing OpenCL extension')
provides=(
    'level-zero-driver'
    'opencl-driver')
source=("https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-intel-compute-runtime-disable-werror.patch'
        '020-intel-compute-runtime-lto-warning-fix-part001.patch'::'https://github.com/intel/compute-runtime/commit/133421a5e9c8f26120413a8b770125c86e5e68d2.patch'
        '030-intel-compute-runtime-lto-warning-fix-part002.patch'::'https://github.com/intel/compute-runtime/commit/7660b29bbbdcf05df14a1a4fe71ebea180a851cd.patch')
sha256sums=('688cdb4cd9af6667842436b4b83b15ca64e848aa903f0686bf93968c0f264f6b'
            'e075b6fe82ba66f2b622c9264933b8cf0af7b23cfac818efb9686a7bdc810df0'
            'e06ff6281a1a3173cf60e8e3ea10a2f3c45141cb639a361b6ca8917079ac39d9'
            '8b343e12469750a8096614366e77b7986c1485a77b1e4961af3931e1b25a0ca6')

prepare() {
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/020-intel-compute-runtime-lto-warning-fix-part001.patch"
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/030-intel-compute-runtime-lto-warning-fix-part002.patch"
}

build() {
    # fix runtime error in blender
    CFLAGS+=' -DSANITIZER_BUILD=1'
    CXXFLAGS+=' -DSANITIZER_BUILD=1'
    
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # opencl-headers supported by upstream is already in the source tree
    # https://github.com/intel/compute-runtime/blob/25.40.35563.4/third_party/opencl_headers/.version#L2
    local _opencl_headers_dir="${srcdir}/compute-runtime-${pkgver}/third_party/opencl_headers"
    export CXXFLAGS+=" -isystem${_opencl_headers_dir}"
    
    cmake -B build -S "compute-runtime-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DNEO_BUILD_UNVERSIONED_OCLOC='ON' \
        -DNEO_DISABLE_LD_GOLD:BOOL='ON' \
        -DNEO_OCL_VERSION_MAJOR="${pkgver%%.*}" \
        -DNEO_OCL_VERSION_MINOR="$(printf "$pkgver" | cut -d . -f2)" \
        -DNEO_VERSION_BUILD="$(printf "$pkgver" | cut -d . -f3)" \
        -DKHRONOS_GL_HEADERS_DIR='/usr/include' \
        -DKHRONOS_HEADERS_DIR="$_opencl_headers_dir" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "compute-runtime-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
}
