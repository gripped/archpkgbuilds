# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonivox
pkgver=3.6.16
pkgrel=1
pkgdesc="Fork of the AOSP 'platform_external_sonivox' to use outside of Android"
arch=(x86_64)
url="https://github.com/pedrolcl/sonivox"
license=(Apache-2.0)
depends=(glibc)
makedepends=(cmake gtest)
provides=(libsonivox.so)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  https://www.ronimusic.com/sf2/Airfont_340.dls  # soundfont required for testing...
)
sha256sums=('8e9adf39a5e60c5b9ce4d1b79c83680cfab97d6e8eec6ffb6a3d0bad41413531'
            'beb3e39e3c9fc51ef4dff36fdd8db0361471a91d244c3ee78af90f6d3c783b04')
b2sums=('8aa8174aa13f9196dda5865a5d8d2fd35ca170ef12a7196e70ed424f0e9ac1162af07ef27e28b4f770fdff7d3d2b8cb8a0aba553ae160f4088de3cb7c66efef0'
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
