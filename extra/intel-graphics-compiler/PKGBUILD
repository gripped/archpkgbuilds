# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.16.0
_llvmmaj=15
_llvmver="${_llvmmaj}.0.7"
_vciver=0.23.1
_spirv_tools_ver=2025.1.rc1
_spirv_headers_commit=aa6cef192b8e693916eb713e7a9ccadf06062ceb
_spirv_llvm_commit=6fd7ff4e76b344dd17cca735af60ee613f322440
_opencl_clang_commit=7eef46576eca117685ae431735c2725ddb889260
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'gcc-libs'
    'glibc'
    'zlib'
    'zstd')
makedepends=(
    'cmake'
    'git'
    'python'
    'python-mako'
    'python-yaml')
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
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('e8b74139d28e3c3be6acde94ac9e106af913dcaa495e2c687cdcb520f0a26538'
            'b05cabc364c71450738b999906df5ffae683c3501760a3edaa71f113b3cbc1a0'
            '476261320cc1eb22dd6bc46b4632abde878a3703352909928e71773ee7059246'
            '7659e07da76ea409cdf6665c6a28c1b88702c7846062f03c9be7917c9114376e'
            '0d9741de558943f181437dd5141dbb0af4d266aed63fc1eb6356708dfca25258'
            '20b358895a331ebaf921d5dfce5042a03f2f262b9b64b33a421710abd2255a93'
            '5e0b72ca37446fdf0fa54f1bb4cea6d3a53c19bdf373fa054b6a8ce640519024'
            '505a6f3e4cd4a47bb23b6567c965127a2399a04e1246d0d7b1dfddf1b9c6c1e2')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    EMAIL='builduser@archlinux.org' \
    git -C llvm-project cherry-pick 7e44305041d96b064c197216b931ae3917a34ac1
    
    patch -d "intel-graphics-compiler-${pkgver}" -Np1 -i "${srcdir}/010-intel-graphics-compiler-disable-werror.patch"
}

build() {
    # Prevent IGC to load LLVM 15+ symbols
    CFLAGS+=' -fno-semantic-interposition'
    CXXFLAGS+=' -fno-semantic-interposition'
    LDFLAGS+=' -Wl,-Bsymbolic'
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"

    EMAIL='builduser@archlinux.org' \
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCCLANG_FROM_SYSTEM=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5.0 \
        -DIGC_OPTION__CLANG_MODE=Source \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR=ON \
        -DIGC_OPTION__LLD_MODE=Source \
        -DIGC_OPTION__LLVM_MODE=Source \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION="${_llvmver}" \
        -DIGC_OPTION__SPIRV_TOOLS_MODE=Source \
        -DIGC_OPTION__USE_PREINSTALLED_SPIRV_HEADERS=OFF \
        -DIGC_OPTION__VC_INTRINSICS_MODE=Source \
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
