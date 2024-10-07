# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonivox
pkgver=3.6.14
pkgrel=1
pkgdesc="Fork of the AOSP 'platform_external_sonivox' to use outside of Android"
arch=(x86_64)
url="https://github.com/pedrolcl/sonivox"
license=(Apache-2.0)
depends=(glibc)
makedepends=(cmake gtest)
provides=(libsonivox.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('216171c5bbe4f5a9524d73a2ee9e7e597c71a040e5d7c9e35b92c9dc459c2985')
b2sums=('1a814fe114c101816efc7b44898ac0e7482dc4eb87ec58aad6ae3e9656598b6ee3d258d06834298cc5cbe001d52702fbe0c80efe43b7c09bfcc1ca37c7f68e81')

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
