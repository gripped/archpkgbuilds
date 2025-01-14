# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.5.6
_llvmmaj=14
_llvmver="${_llvmmaj}.0.5"
_vciver=0.21.0
_spirv_tools_ver=2023.6.rc1
_spirv_headers_commit=1c6bb2743599e6eb6f37b2969acc0aef812e32e3
_spirv_llvm_commit=efbedd32b700c01a15d44121fca862625c2594ac
_opencl_clang_commit=470cf0018e1ef6fc92eda1356f5f31f7da452abc
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'python' 'python-mako' 'python-yaml')
provides=("intel-opencl-clang=${_llvmmaj}")
conflicts=('intel-opencl-clang')
replaces=('intel-opencl-clang')
options=('!emptydirs' '!lto')
source=("https://github.com/intel/intel-graphics-compiler/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/intel/vc-intrinsics.git#tag=v${_vciver}"
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#commit=${_spirv_llvm_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${_spirv_tools_ver}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}"
        "git+https://github.com/intel/opencl-clang.git#commit=${_opencl_clang_commit}"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}")
sha256sums=('33ebff467dd90a405cbfdfb9a957f67a246f774ecbfccdcc9fb38d215d06521c'
            '79de6400e22088b28c4bc89d866e9c8f45c699ce50bff1759f71ec50b16c521f'
            '98e8aa29720160978a0a83c81e781e233254073fa10515aeae230600530c4c4c'
            'ad11e234110902f42c9e54d2f4bb014b64e280ac9428f4c03a04b8b4571112b8'
            '86b7a82e8169097bb84741dff6003da85c841f9d3514034b213896c498ae294c'
            '19214ef9956892960ebd10c91f13cde103ccd270aa4681bdeeb048eb500cd165'
            'f04acc3523802bc24fef7753c8e4326502b8525cb516705f362972ef5698d6c3')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
}

build() {
    # Prevent IGC to load LLVM 15+ symbols
    CFLAGS+=" -fno-semantic-interposition"
    CXXFLAGS+=" -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic"
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"

    EMAIL='builduser@archlinux.org' \
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DIGC_OPTION__ARCHITECTURE_TARGET=Linux64 \
        -DIGC_OPTION__SPIRV_TOOLS_MODE=Source \
        -DIGC_OPTION__USE_PREINSTALLED_SPIRV_HEADERS=OFF \
        -DIGC_OPTION__CLANG_MODE=Source \
        -DIGC_OPTION__LLD_MODE=Source \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION="${_llvmver}" \
        -DIGC_OPTION__LLVM_MODE=Source \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR=ON \
        -DIGC_OPTION__USE_KHRONOS_SPIRV_TRANSLATOR_IN_SC=ON \
        -DIGC_OPTION__VC_INTRINSICS_MODE=Source \
        -DCCLANG_FROM_SYSTEM=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}"/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc${pkgver%%.*}/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/bin/lld"
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmmaj}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
