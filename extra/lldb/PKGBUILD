# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lldb
pkgver=19.1.6
pkgrel=1
pkgdesc="Next generation, high-performance debugger"
arch=('x86_64')
url="https://lldb.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm-libs' 'clang' 'gcc-libs' 'zlib' 'xz' 'libedit' 'ncurses'
         'libxml2' 'python')
makedepends=('llvm' 'cmake' 'ninja' 'swig' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lldb-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('76b6f578cbb9a7fd1eeb25667d140b0e80fb157a7404099258f30f7d2b37b292'
            'SKIP'
            'ad1a3b125ff014ded290094088de40efb9193ce81a24278184230b7d401f8a3e'
            'SKIP'
            '9c7ec82d9a240dc2287b8de89d6881bb64ceea0dcd6ce133c34ef65bda22d99e'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  rename -v -- "-$pkgver.src" '' {llvm,cmake}-$pkgver.src
  cd lldb-$pkgver.src
  mkdir build
}

build() {
  cd lldb-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
  )
  cmake .. "${cmake_args[@]}"
  ninja all docs-lldb-man
}

package() {
  cd lldb-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 docs/man/lldb.1 "$pkgdir/usr/share/man/man1/lldb.1"

  # Compile Python scripts
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -OO -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:
