# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.27.10
_llvmmaj=16
_llvmver="${_llvmmaj}.0.6"
_vciver=0.24.2
_spirv_tools_commit=28a883ba4c67f58a9540fb0651c647bb02883622
_spirv_headers_commit=01e0577914a75a2569c846778c2f93aa8e6feddd
_spirv_llvm_commit=ee2a14e38f24c422cf1f0375b5b9cec0afe4412c
_opencl_clang_commit=6ab2da341420eba7d022a85a5190c46133347719
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
sha256sums=('3e6114f0c371ed88e1b0930b35ff8ac468c63f5448bf52e31341223e19cf572f'
            'fea4af79a1819253827a1d05f884d729e091a480decbdf0033144d66287ef676'
            'e2e661178c52c60ff0449f93d538e42cf69ec0017d05c359e3fee6503151031f'
            'e028a800c43945d94fc100aa25427d360a21c00b1154fb239ec2fce0c06ea85d'
            '8d4d0e7c1e60914372fb7dae6e491f346af481f73901fd4b0970be7f7ef73b81'
            '317f8e11edcb3cc7a065ccb866a2609afa4fd5673fe9a6514b397d576bf9a5cb'
            'b47ada280614670a467f80e9f8c67542050983f238f2f4b3fa17682855faf9bf'
            'eac4352a78d537e8a6bbca55c059377dc704e3e1e5a267c99a0e9edda7a87380')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    export GIT_COMMITTER_NAME='builduser'
    export GIT_COMMITTER_EMAIL='builduser@archlinux.org'
    git -C llvm-project cherry-pick 7e44305041d96b064c197216b931ae3917a34ac1
    
    patch -d "intel-graphics-compiler-${pkgver}" -Np1 -i "${srcdir}/010-intel-graphics-compiler-disable-werror.patch"
}

build() {
    # Prevent IGC to load LLVM 17+ symbols
    export CFLAGS+=' -fno-semantic-interposition'
    export CXXFLAGS+=' -fno-semantic-interposition'
    export LDFLAGS+=' -Wl,-Bsymbolic'
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"

    export GIT_COMMITTER_NAME='builduser'
    export GIT_COMMITTER_EMAIL='builduser@archlinux.org'
    
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCCLANG_FROM_SYSTEM=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5.0 \
        -DCMAKE_SKIP_RPATH=YES \
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
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/opencl_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmmaj}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
