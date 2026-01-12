# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonivox
pkgver=4.0.0
pkgrel=1
pkgdesc="Fork of the AOSP 'platform_external_sonivox' to use outside of Android"
arch=(x86_64)
url="https://github.com/EmbeddedSynth/sonivox"
license=(Apache-2.0)
depends=(
  glibc
  zlib
)
makedepends=(
  cmake
  gtest
)
provides=(libsonivox.so)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  https://www.ronimusic.com/sf2/Airfont_340.dls  # soundfont required for testing...
)
sha256sums=('bd07e384041df010576b2bc1626625465f93ac6ae2e96ae792d0994b816880b1'
            'beb3e39e3c9fc51ef4dff36fdd8db0361471a91d244c3ee78af90f6d3c783b04')
b2sums=('af4abeae6d8c2901ea95b6e687b47695fe447a89dfa74183ac80c74fc829d0e06ddab5625aabcae6baa7bc8c081d6b5fd2d36f23b76a7d5b1af90587234509ce'
        '298ea526ddd68367817ffbec77e8f338bbc167a608f3d670a96d2c517923cb72e44df9bde5aafd97faad0139789732dc2975be9f9d7bee3c7c6cecc78014bf47')

prepare() {
  # Symlink the soundfont required for unit tests into place:
  # https://github.com/pedrolcl/sonivox/issues/87
  ln -s Airfont_340.dls soundfont.dls
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  # This ensures the soundfont used in unit tests is found and not downloaded during build.
  export TEMP="$srcdir"
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
