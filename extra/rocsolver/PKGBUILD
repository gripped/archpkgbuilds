# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=rocsolver
pkgver=10.1
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocSOLVER/en/latest/index.html'
license=('BSD-2-Clause')
depends=(
    'glibc'
    'hip-runtime-amd'
    'libgcc'
    'libstdc++'
    'rocblas'
    'rocm-core'
    # Loaded with dlopen
    'rocsparse'
)
makedepends=(
    'cmake'
    'fmt'
    'ninja'
    'rocm-cmake'
    'rocm-llvm'
    'rocm-toolchain'
    'rocprim'
)
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('5c8a54fe17245f2d81ccf4f6c3491cfe61448dac44945c13eccf1ffd0cdfee67')
options=(!lto)

build() {
    # -g also emits DWARF for every GPU target into .hip_fatbin, which strip
    # does not remove. Keep host debug info only.
    CXXFLAGS+=" -Xarch_device -g0"

    # -fcf-protection is not supported by HIP, see
    # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
    local cmake_args=(
        -Wno-dev
        -S "$pkgname"
        -B build
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
        -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
        -D CMAKE_INSTALL_PREFIX=/opt/rocm
        -D ROCSOLVER_EMBED_FMT=ON
        # gfx9-generic does not cover gfx908 and gfx90a.
        -D AMDGPU_TARGETS="$(rocm-supported-gfx);gfx908:xnack-;gfx90a:xnack+;gfx90a:xnack-"
    )
    cmake "${cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
