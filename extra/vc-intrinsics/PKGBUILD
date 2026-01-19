# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vc-intrinsics
pkgver=0.24.2
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
sha256sums=('fea4af79a1819253827a1d05f884d729e091a480decbdf0033144d66287ef676')

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
