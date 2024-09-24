# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonivox
pkgver=3.6.13
pkgrel=1
pkgdesc="Fork of the AOSP 'platform_external_sonivox' to use outside of Android"
arch=(x86_64)
url="https://github.com/pedrolcl/sonivox"
license=(Apache-2.0)
depends=(glibc)
makedepends=(cmake gtest)
provides=(libsonivox.so)
source=($pkgname-$pkgver.tar.gz::https://github.com/pedrolcl/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c5c088acc423a78f7ec103f3d99c7b16c85301c2969dcebdc49537c7247790c4')
b2sums=('4d466059b6a5335bd6cc9c6f2c8e31b8607a184415522b906bc6c393306000a6e59e8ba9dee7663c392e4ec0c74de45fdeac70bc00efbd2e80ab966ddf6865e5')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
