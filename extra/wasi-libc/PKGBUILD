# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wasi-libc
pkgver=0+374+9e8c5423
_commit=9e8c542319242a5e536e14e6046de5968d298038  # tags/wasi-sdk-22
pkgrel=2
epoch=1
pkgdesc='WASI libc implementation for WebAssembly'
url='https://github.com/WebAssembly/wasi-libc'
arch=('any')
license=('Apache-2.0 WITH LLVM-exception AND Apache-2.0 AND MIT')
makedepends=(
  'clang'
  'git'
  'llvm'
)
options=('staticlibs')
source=("git+https://github.com/WebAssembly/wasi-libc.git#commit=${_commit}")
b2sums=('b38704e419dba9be28004d2615800082832769874573d8d9534e4c0386cf9a93214872bda7ce2d3793ec7a5a16bd444adef0b221cfbe60e38216b53b1cf02346')

pkgver() {
  cd ${pkgname}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local target= make_options=(
    WASM_CC=/usr/bin/clang
    WASM_AR=/usr/bin/llvm-ar
    WASM_NM=/usr/bin/llvm-nm
  )
  local -A targets=(
    wasm32-wasi           ''
    wasm32-wasip1         ''
    wasm32-wasip1-threads 'THREAD_MODEL=posix'
    wasm32-wasip2         'WASI_SNAPSHOT=p2'
  )

  cd ${pkgname}

  for target in "${!targets[@]}"; do
    make "${make_options[@]}" TARGET_TRIPLE="$target" ${targets[$target]}
  done
}

package() {
  cd ${pkgname}
  install -dm755 "${pkgdir}"/usr/share
  cp -dr --preserve=mode,timestamp sysroot "${pkgdir}"/usr/share/wasi-sysroot
  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim:set sw=2 sts=-1 et:
