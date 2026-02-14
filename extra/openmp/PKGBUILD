# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=openmp
pkgver=21.1.8
pkgrel=1
pkgdesc="LLVM OpenMP Runtime Library"
arch=('x86_64')
url="https://openmp.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm-libs' 'libelf' 'libffi')
makedepends=('llvm' 'clang' 'cmake' 'ninja' 'python')
optdepends=('cuda: offloading to NVIDIA GPUs'
            'hsa-rocr: offloading to AMD GPUs')
options=('!lto') # https://bugzilla.redhat.com/show_bug.cgi?id=1988155
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/openmp-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('856b023748b41ac7b2c83fd8e9f765ff48a4df2fe6777d2811ef7c7ed8f2f977'
            'SKIP'
            '85735f20fd8c81ecb0a09abb0c267018475420e93b65050cc5b7634eab744de9'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

prepare() {
  mv cmake{-$pkgver.src,}
  cd openmp-$pkgver.src
  mkdir build
}

build() {
  cd openmp-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DLIBOMP_INSTALL_ALIASES=OFF
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

package() {
  cd openmp-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/lib/libarcher_static.a"

  # Compile Python scripts
  python -m compileall -d /usr/share "$pkgdir/usr/share"
  python -O -m compileall -d /usr/share "$pkgdir/usr/share"
  python -OO -m compileall -d /usr/share "$pkgdir/usr/share"
}

# vim:set ts=2 sw=2 et:
