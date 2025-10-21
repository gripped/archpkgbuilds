# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld
pkgver=21.1.3
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
sha256sums=('8904e54475ca8426bc79b9278af1c3cccb40bf9958bd3f7d15f692f1b237d56f'
            'SKIP'
            'a80f2dbfa24a0c4d81089e6245936dcd0c662c90f643d1706bb44e7bc8338ff1'
            'SKIP'
            'ce4c70d9086bff55525cb4cc653306be46b668b7719b1d1a4da4d309902c9d38'
            'SKIP'
            '4db6f028b6fe360f0aeae6e921b2bd2613400364985450a6d3e6749b74bf733a'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
)

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
