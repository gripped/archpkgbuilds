# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=lib32-clang
pkgver=21.1.6
pkgrel=1
pkgdesc="C language family frontend for LLVM (32-bit)"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('lib32-llvm-libs' 'clang')
makedepends=("lib32-llvm=1:$pkgver" 'cmake' 'ninja' 'python')
optdepends=('lib32-llvm: referenced by some clang headers')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig}
        0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('348ace5d715c4caa6fb89b4c6fe07c21650e10b2fac37d8b0db75c0b11be9011'
            'SKIP'
            '908bce97be0275943414b45af2e2b20e8f6d5d9266fdc120bd59f096ebc547ad'
            'SKIP'
            'e364f135fa14c343d70cac96f577f44e8e20bf026682f647f8c3c5687a0bebd1'
            'SKIP'
            '8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a'
            'SKIP'
            '6f3cc7a4847e03d16ed90341bb71fec98427763ff2351f5344b2ca2ce62a604c'
            '65c2b77693b9380c4e9c08977bed163932fbd72eaaa4dc666bb7310d426f6887')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
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
  rename -v -- "-$pkgver.src" '' cmake-$pkgver.src
  cd clang-$pkgver.src
  mkdir build
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # Revert always linking against libamath when -fveclib=ArmPL
  patch -Np2 -i ../0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us.patch
}

build() {
  cd clang-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_CONFIG=llvm-config32
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_EXTERNAL_CLANG_TOOLS_EXTRA_SOURCE_DIR=
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_INCLUDE_TESTS=OFF
    -DLLVM_LIBDIR_SUFFIX=32
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_THIRD_PARTY_DIR="$srcdir/third-party-$pkgver.src"
    -DLLVM_PACKAGE_BUGREPORT=https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-clang/-/issues
  )

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

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
