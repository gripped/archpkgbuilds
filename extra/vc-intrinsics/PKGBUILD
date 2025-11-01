# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vc-intrinsics
pkgver=0.23.4
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
sha256sums=('616c08e4a383c0dd5f1e662adef931f9a899518468612cb654c97457ed1e61c7')

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
