# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=collada-dom
pkgver=2.5.0
pkgrel=1
pkgdesc="COLLADA Document Object Model (DOM) C++ Library"
arch=('x86_64')
url="https://github.com/rdiankov/collada-dom/"
license=('custom')
depends=('boost-libs' 'minizip' 'libxml2' 'gcc-libs' 'glibc')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rdiankov/collada-dom/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname-fix-boost1.85.patch::https://github.com/rdiankov/collada-dom/pull/43.patch")
sha512sums=('f189d09e2396faa266734981bb7b5e91ec34b6faa9ad340206e769dae316496bf4271c129980668dc2756874dbb8c1157162197d0d3a74075e35200821875156'
            'b1f742316cecf4a932df7ba86f2d3bc7dda8a0cae0b0300c0638e8858e654ce5de8bc351c094f99bb6a9fba693f272de6969411679ac2c4bfe99bb9b95d1ed79')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/$pkgname-fix-boost1.85.patch"
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/licenses/license_e.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  DESTDIR="$pkgdir" cmake --install build
}
