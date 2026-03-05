# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=directx-shader-compiler
pkgver=1.9.2602
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
b2sums=('7d8b7cdb0410e2fb6ac2986026851b1a3486aa558c0a54467aa9d2678e8d5bc90a2ca6e646e45d73aee3a01e9ae53e8d6b9ef3993611fa0d5055949ccb2ce707'
        'SKIP'
        'SKIP'
        'SKIP'
        '018e118593b98e941ffa99882733e361342544c3cf806d256a8e27aca508292b1060aca55aa4c0a46388103818b8e04d193346ed789abf9080ba28756a891c86')

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
