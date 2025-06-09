# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld
pkgver=20.1.6
pkgrel=1
pkgdesc="Linker from the LLVM project"
arch=('x86_64')
url="https://lld.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm-libs' 'gcc-libs' 'zlib' 'zstd')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lld-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/libunwind-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('280239aa9d9b94df484022cd7c28e5601acea5d60d06bc99d6b7de5b4dc516fe'
            'SKIP'
            'f09e304ca98bb809f492ec34f94f587361b4b0d06ed783fb3a41e7fb218e47a1'
            'SKIP'
            'bdf90d0428c2cb7b763677c0932509b6dca9f210183e9e73c129ab32d7b658ef'
            'SKIP'
            'b4b3efa5d5b01b3f211f1ba326bb6f0c318331f828202d332c95b7f30fca5f8c'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  # https://bugs.llvm.org/show_bug.cgi?id=49228
  mv libunwind{-$pkgver.src,}

  mv cmake{-$pkgver.src,}
  cd lld-$pkgver.src
  mkdir build
}

build() {
  cd lld-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_TESTS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd lld-$pkgver.src/build
  ninja check-lld
}

package() {
  cd lld-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # https://bugs.llvm.org/show_bug.cgi?id=42455
  install -Dm644 -t "$pkgdir/usr/share/man/man1" ../docs/ld.lld.1

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/lld/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
