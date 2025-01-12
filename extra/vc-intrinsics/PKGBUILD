# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vc-intrinsics
pkgver=0.21.0
pkgrel=2
pkgdesc="Set of new intrinsics on top of core LLVM IR instructions that represent SIMD semantics of a program targeting GPU"
arch=(x86_64)
url="https://github.com/intel/vc-intrinsics"
license=(MIT)
makedepends=(cmake python llvm git)
source=(git+${url}.git#tag=v$pkgver)
sha256sums=('79de6400e22088b28c4bc89d866e9c8f45c699ce50bff1759f71ec50b16c521f')

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
