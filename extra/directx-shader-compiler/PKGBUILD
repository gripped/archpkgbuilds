# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=directx-shader-compiler
pkgver=1.8.2505.1
pkgrel=2
pkgdesc="Compiler for HLSL to DXIL (DirectX Intermediate Language)"
url="https://github.com/microsoft/DirectXShaderCompiler"
arch=(x86_64)
license=(
  NCSA
  'Apache-2.0 WITH LLVM-exception' # HLSL headers
)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  clang
  cmake
  git
  libxml2
  ninja
  python
)
source=(
  "$pkgname::git+$url#tag=v${pkgver}"
  "directx-headers::git+https://github.com/microsoft/DirectX-Headers"
  "git+https://github.com/KhronosGroup/SPIRV-Headers"
  "git+https://github.com/KhronosGroup/SPIRV-Tools"
  0001-Install-more-components.patch
)
b2sums=('3335d42eee2baa254a377c8e4273bd623374ddef12befb675f22018801c906fd70ebcf60cd289cefa33a6b4edba85c13f90a4f881f28306682e2661330da1c68'
        'SKIP'
        'SKIP'
        'SKIP'
        'a3929c6600b84dd2b3ed8475b95bb1860addc5cc4ae4d1139b09525e8c4a1d754f1f5d4cb0a24cd42d41c75d790f6da0ce965f9e2a40888602ab643f88a7c9de')

prepare() {
  cd $pkgname

  # Install more components
  # https://gitlab.archlinux.org/archlinux/packaging/packages/directx-shader-compiler/-/issues/2
  git apply -3 ../0001-Install-more-components.patch

  git submodule init
  git submodule set-url external/DirectX-Headers "$srcdir/directx-headers"
  git submodule set-url external/SPIRV-Headers "$srcdir/SPIRV-Headers"
  git submodule set-url external/SPIRV-Tools "$srcdir/SPIRV-Tools"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local cmake_options=(
    -C $pkgname/cmake/caches/PredefinedParams.cmake
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D HLSL_INCLUDE_TESTS=OFF
    -D HLSL_OFFICIAL_BUILD=ON
    -D LLVM_BUILD_TOOLS=OFF
    -D LLVM_INCLUDE_TESTS=OFF
  )

  cmake -B build -S $pkgname -G Ninja "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install-distribution
  install -Dm644 $pkgname/LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/include/hlsl/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
