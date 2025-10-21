# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=openmp
pkgver=21.1.3
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
sha256sums=('a3f6af3d9e80ec6217e92675d4253db85f006d788943b8ccacf18bde23d2b816'
            'SKIP'
            '4db6f028b6fe360f0aeae6e921b2bd2613400364985450a6d3e6749b74bf733a'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
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
