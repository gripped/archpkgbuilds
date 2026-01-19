# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-compute-runtime
pkgver=26.01.36711.4
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
        '010-intel-compute-runtime-disable-werror.patch')
sha256sums=('f92c011244488e8a0832a3fc524e30571a2253dbdfd9b6b541438a85f2c2674c'
            'c742a0dcf3404b3c0ec116887c148b21f9f09f7131c6372a44b21dfd4b7fb67b')

prepare() {
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
}

build() {
    # fix runtime error in blender
    export CFLAGS+=' -DSANITIZER_BUILD=1'
    export CXXFLAGS+=' -DSANITIZER_BUILD=1'
    
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # opencl-headers supported by upstream is already in the source tree
    # https://github.com/intel/compute-runtime/blob/26.01.36711.4/third_party/opencl_headers/.version#L2
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
