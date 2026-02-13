# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vc-intrinsics
pkgver=0.24.3
pkgrel=1
pkgdesc="Set of new intrinsics on top of core LLVM IR instructions that represent SIMD semantics of a program targeting GPU"
arch=(x86_64)
url="https://github.com/intel/vc-intrinsics"
license=(MIT)
makedepends=(
  cmake
  git
  llvm
  python)
source=(git+${url}.git#tag=v$pkgver)
sha256sums=('043c7628d557e24faafc2718f40037be7db219b471c52b0914b7edfd21233080')

build() {
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake -B build -S ${pkgname} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm 644 $pkgname/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
