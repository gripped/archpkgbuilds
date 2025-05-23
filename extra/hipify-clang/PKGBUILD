# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=hipify-clang
pkgver=6.4.0
pkgrel=1
pkgdesc='Convert CUDA to Portable C++ Code'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIPIFY/en/latest'
license=('MIT')
depends=('glibc' 'gcc-libs' 'ncurses' 'bash' 'perl' 'zstd' 'zlib'
         'rocm-llvm' 'cuda')
makedepends=('cmake')
_git='https://github.com/ROCm-Developer-Tools/HIPIFY'
source=("${pkgname}-${pkgver}.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('874e3ee9801f795aaae30d6ea86e5edc991d5f71a5dee0a8e8eb7ce6379a51eb')
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
