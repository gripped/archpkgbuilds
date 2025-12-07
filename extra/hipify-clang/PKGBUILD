# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=hipify-clang
pkgver=7.1.1
pkgrel=1
pkgdesc='Convert CUDA to Portable C++ Code'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIPIFY/en/latest'
license=('MIT')
depends=(
  'bash'
  'cuda'
  'gcc-libs'
  'glibc'
  'ncurses'
  'perl'
  'rocm-llvm'
  'zlib'
  'zstd'
)
makedepends=('cmake')
_git='https://github.com/ROCm/HIPIFY'
source=("${pkgname}-${pkgver}.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('abb80ecc0ea82fd847a95a9c2dd1d182990a7a495f1eab6126e7c5e9dc8b68a7')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
  local cmake_args=(
        -B build
        -S "$_dirname"
        -Wno-dev
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/opt/rocm
        -DCMAKE_PREFIX_PATH=/opt/rocm/lib/llvm/lib/cmake
    )
    cmake "${cmake_args[@]}"
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # The script hipify-perl is generated read-only
  chmod a+x "$pkgdir/opt/rocm/bin/hipify-perl"

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
