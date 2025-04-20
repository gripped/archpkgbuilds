# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>

pkgname=intel-graphics-compiler
pkgver=2.10.8
_llvmmaj=15
_llvmver="${_llvmmaj}.0.7"
_vciver=0.22.1
_spirv_tools_ver=2025.1.rc1
_spirv_headers_commit=0e710677989b4326ac974fd80c5308191ed80965
_spirv_llvm_commit=2d4f2e7a7968392de017fcd3e4b503a75f0c12d2
_opencl_clang_commit=58242977b4092cf5eb94a10dd144691c12c87001
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('cmake' 'git' 'python' 'python-mako' 'python-yaml')
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
sha256sums=('001940364b91b8e156ee1858170143601b0b6162a7d143530dd846c7b83edfe2'
            '11fbabe4654a13a6f1248448e62e12ae28b6605bbf8e444675d6e2f0588d23e7'
            'aefcc9afb7c1475b7131ea3c2d9b0ed8b1813a31f42543fa3ebfe9498c8ce869'
            '7659e07da76ea409cdf6665c6a28c1b88702c7846062f03c9be7917c9114376e'
            'c2b9afa462bddbb499642fe69f8f932719ce4bfe866fe107cbec1f816d300b09'
            'cc4961a1701dc241d9a3c8c7f0d9a1ab8302f6f70b3df036e73313c32bf551f2'
            '5e0b72ca37446fdf0fa54f1bb4cea6d3a53c19bdf373fa054b6a8ce640519024')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
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
        -DIGC_OPTION__ARCHITECTURE_TARGET=Linux64 \
        -DIGC_OPTION__CLANG_MODE=Source \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR=ON \
        -DIGC_OPTION__LLD_MODE=Source \
        -DIGC_OPTION__LLVM_MODE=Source \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION="${_llvmver}" \
        -DIGC_OPTION__SPIRV_TOOLS_MODE=Source \
        -DIGC_OPTION__USE_KHRONOS_SPIRV_TRANSLATOR_IN_SC=ON \
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
