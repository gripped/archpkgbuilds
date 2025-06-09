# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lib32-clang
pkgver=20.1.6
pkgrel=1
pkgdesc="C language family frontend for LLVM (32-bit)"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('lib32-llvm-libs' 'gcc-multilib')
makedepends=('lib32-llvm' 'cmake' 'ninja' 'python')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig}
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('49a16d6b6878a6bdd9ead2d31ffb94c792675607471afa40096fbd48b3cbab66'
            'SKIP'
            'f09e304ca98bb809f492ec34f94f587361b4b0d06ed783fb3a41e7fb218e47a1'
            'SKIP'
            'b4b3efa5d5b01b3f211f1ba326bb6f0c318331f828202d332c95b7f30fca5f8c'
            'SKIP'
            '33530189d31b2396b76a7ebac8f938747b3619154cc37015cef9dea29292f7e2'
            'SKIP'
            'ef319e65f927718e1d3b1a23c480d686b1d292e2a0bf27229540964f9734117a')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>


# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
        continue
        ;;
      clang-tidy-headers)
        continue
        ;;
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols|scan-build-py)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
  cd clang-$pkgver.src
  mkdir build
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch
}

build() {
  cd "$srcdir/clang-$pkgver.src/build"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DCMAKE_CXX_FLAGS:STRING=-m32
    -DCMAKE_C_FLAGS:STRING=-m32
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_DOCS=OFF
    -DLLVM_BUILD_TESTS=OFF
    -DLLVM_CONFIG="/usr/bin/llvm-config32"
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=OFF
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_LIBDIR_SUFFIX=32
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

package() {
  cd clang-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution
  rm -rf "$pkgdir"/usr/{bin,include,lib,libexec,share}

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
