# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vc-intrinsics
pkgver=0.25.0
pkgrel=1
pkgdesc='Set of new intrinsics on top of core LLVM IR instructions that represent SIMD semantics of a program targeting GPU'
arch=('x86_64')
url='https://github.com/intel/vc-intrinsics/'
license=('MIT')
makedepends=(
    'cmake'
    'git'
    'llvm'
    'python')
source=("git+https://github.com/intel/vc-intrinsics.git#tag=v${pkgver}")
sha256sums=('af6abe889504fc5f0cc61758aa306211ec2be086858e9e39ee96d289a6c0117c')

build() {
    export CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build -S vc-intrinsics \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLLVM_DIR:PATH='/usr/lib/cmake/llvm' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 vc-intrinsics/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
