# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=directx-shader-compiler
pkgver=1.10.2605.2
pkgrel=1
pkgdesc="Compiler for HLSL to DXIL (DirectX Intermediate Language)"
url="https://github.com/microsoft/DirectXShaderCompiler"
arch=(x86_64)
license=(
  NCSA
  'Apache-2.0 WITH LLVM-exception' # HLSL headers
)
depends=(
  glibc
  libgcc
  libstdc++
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
b2sums=('f2697d53105e4a9500ce9cfd5a72a6b717182a69ef4a1cf01b0324c10778a9b81113f4fb53bc6620bb537e67966887f9deb3474459200724c9aa215ea3353144'
        'SKIP'
        'SKIP'
        'SKIP'
        '22c47f50daaff773357104b46740aa9d81851351a2dafac66ff10e2604374f9e922d361e63478ce82e0610c79f875f928f21bb9706efe0c1469f67b6204c46d4')

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
