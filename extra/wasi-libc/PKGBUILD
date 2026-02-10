# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wasi-libc
pkgver=0+531+ec0effd7
_commit=ec0effd769df5f05b647216578bcf5d3b5449725 # tags/wasi-sdk-30
pkgrel=1
epoch=1
pkgdesc='WASI libc implementation for WebAssembly'
url='https://github.com/WebAssembly/wasi-libc'
arch=('any')
license=('Apache-2.0 WITH LLVM-exception AND Apache-2.0 AND MIT')
makedepends=(
  clang
  cmake
  git
  llvm
  ninja
)
options=(
  !buildflags
  staticlibs
)
source=("git+https://github.com/WebAssembly/wasi-libc.git#commit=${_commit}")
b2sums=('6050e62313411cdc25883ec491ca16885e992ea8954e3b8dbf75a4c420fb34f5ec32776260b238d9ca37488135372ed009574997b566a4cc3be22f621b131f16')

pkgver() {
  cd ${pkgname}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local targets=(
    wasm32-wasi
    wasm32-wasip1
    wasm32-wasip1-threads
    wasm32-wasip2
  ) cmake_options=(
    -S ${pkgname}
    -B build
    -G Ninja
    -D BUILD_SHARED=off
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_C_COMPILER=clang
  )

  for target in "${targets[@]}"; do
    cmake "${cmake_options[@]}" -D TARGET_TRIPLE="${target}"
    cmake --build build
  done
}

package() {
  install -dm755 "${pkgdir}"/usr/share
  cp -dr --preserve=mode,timestamp build/sysroot "${pkgdir}"/usr/share/wasi-sysroot
  install -Dm644 ${pkgname}/LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim:set sw=2 sts=-1 et:
