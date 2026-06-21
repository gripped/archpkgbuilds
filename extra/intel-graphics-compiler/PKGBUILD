# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.36.3
_llvmmaj=17
_llvmver="${_llvmmaj}.0.6"
_vciver=0.25.0
_spirv_tools_commit=28a883ba4c67f58a9540fb0651c647bb02883622
_spirv_headers_commit=b8a32968473ce852a809b9de5f04f02a5a9dfa78
_spirv_llvm_commit=112b565bc334d937b8ac8f99c81178e6657bc155
_opencl_clang_commit=54ed27657aab5324f2102a8bfa3fe4ad37ec7345
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
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
# upstream do not support LTO
# https://github.com/intel/intel-graphics-compiler/issues/362#issuecomment-4089628783
options=('!emptydirs' '!lto')
source=("https://github.com/intel/intel-graphics-compiler/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/intel/vc-intrinsics.git#tag=v${_vciver}"
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#commit=${_spirv_llvm_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=${_spirv_tools_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}"
        "git+https://github.com/intel/opencl-clang.git#commit=${_opencl_clang_commit}"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('10ad6588806a1d75a9953d5fa48273f1d129ea63246f4cb51993fd95086cad77'
            'af6abe889504fc5f0cc61758aa306211ec2be086858e9e39ee96d289a6c0117c'
            '948e2e28c28e1bc5aea772aed7305d02408706b42140dae5bcb34290015ae48c'
            'e028a800c43945d94fc100aa25427d360a21c00b1154fb239ec2fce0c06ea85d'
            'b6e24e13903d09a8a5d75a457a8bd3e0c676d1b08a81e8ffb6293d25f915024b'
            '17c37e63ab8f0d9381c3fa4f2dc8cf7051ed258397936aaac5cde0c16edbdfd1'
            '5cba4bf5388b65e4883908519ec087b5cca23ef3c747fa01e382802c1c62b1da'
            'bfea004c51e40e25a3e12058ffa0903b577c80092eefc37be33f748fd2dd3920')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
    
    patch -d "intel-graphics-compiler-${pkgver}" -Np1 -i "${srcdir}/010-intel-graphics-compiler-disable-werror.patch"
}

build() {
    # Prevent IGC to load LLVM 18+ symbols
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
