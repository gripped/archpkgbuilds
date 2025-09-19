# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.18.5
_llvmmaj=15
_llvmver="${_llvmmaj}.0.7"
_vciver=0.23.1
_spirv_tools_commit=28a883ba4c67f58a9540fb0651c647bb02883622
_spirv_headers_commit=04b76709bf40a7ce8df3382060ef3620f19de566
_spirv_llvm_commit=a077a090060f953ba7dd024208980ca837233d87
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
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=${_spirv_tools_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}"
        "git+https://github.com/intel/opencl-clang.git#commit=${_opencl_clang_commit}"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('11ead7f13f85d27412b6864c5db9bb86cf8d38e4d04a76e468a2cd4416e8df3b'
            'b05cabc364c71450738b999906df5ffae683c3501760a3edaa71f113b3cbc1a0'
            '02c161ac55930f4e68b00e37448b987a00a62fccbad09f791070eee54149c589'
            'e028a800c43945d94fc100aa25427d360a21c00b1154fb239ec2fce0c06ea85d'
            '157890d75d99e923eb97ab8e00499d13ef21cc34f9814b6ae5f6f9c7f2ec2e56'
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
