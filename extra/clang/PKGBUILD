# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang
pkgver=19.1.6
pkgrel=1
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm-libs' 'gcc' 'compiler-rt')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx' 'python-myst-parser')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm: referenced by some clang headers')
provides=("clang-analyzer=$pkgver" "clang-tools-extra=$pkgver")
conflicts=('clang-analyzer' 'clang-tools-extra')
replaces=('clang-analyzer' 'clang-tools-extra')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig}
        clang-disable-float128-diagnostics-for-device-compilation.patch::https://github.com/llvm/llvm-project/commit/318bff6811e7.patch
        support-__GCC_-CON-DE-STRUCTIVE_SIZE.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('6358cbb3e14687ca2f3465c61cffc65589b448aaa912ec2c163ef9fc046e8a89'
            'SKIP'
            '417a7d0048d8eb62dbaa8461f1fd474eb6493b09e14d050b39cc1f051e8b71d1'
            'SKIP'
            'ad1a3b125ff014ded290094088de40efb9193ce81a24278184230b7d401f8a3e'
            'SKIP'
            '9c7ec82d9a240dc2287b8de89d6881bb64ceea0dcd6ce133c34ef65bda22d99e'
            'SKIP'
            '0e8048333bab2ba3607910e5d074259f08dccf00615778d03a2a55416718eb45'
            'SKIP'
            '94a3d4df2443f9dc9e256e6c0c661ff4a4ca4f34a5ca351f065511b9694faf2a'
            '8832b4ee02fe8a0e57fca608288242f80e348ee9b60be3eb0069c8b91a42fbf4'
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
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols)
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
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch

  # Fix hardcoded test path
  sed -i 's/clang-tools-extra/tools\/extra/g' tools/extra/test/clang-doc/enum.cpp
  sed -i 's/clang-tools-extra/tools\/extra/g' tools/extra/test/clang-doc/namespace.cpp
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
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_DOCS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd clang-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check-clang{,-tools}
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package() {
  cd clang-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/clang{,-tools}/html/{_sources,.buildinfo}

  # Move scanbuild-py into site-packages and install Python bindings
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages"
  mv "$pkgdir"/usr/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"
  cp -a ../bindings/python/clang "$pkgdir/$site_packages/"

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/clang/"
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|libexec|lib/clang|' \
    "$pkgdir/usr/bin/scan-build" \
    "$pkgdir/$site_packages/libscanbuild/analyze.py"

  # Compile Python scripts
  _python_optimize "$pkgdir/usr/share" "$pkgdir/$site_packages"
}

# vim:set ts=2 sw=2 et:
