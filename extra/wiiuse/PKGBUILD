# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=wiiuse
pkgver=0.15.7
pkgrel=1
pkgdesc="A library written in C that connects with several Nintendo Wii remotes"
arch=(x86_64)
url="https://github.com/wiiuse/wiiuse"
license=(GPL-3.0-or-later)
depends=(
  bluez-libs
  glibc
)
provides=(libwiiuse.so)
makedepends=(cmake)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('dcd65bc8c5890de85683c7689e55b56204127e78947cf1fbb6ce29ea5b4b0bda20ed721439297cb53163e9f94a7fad0579d90edb172fc4ceacc367fe9fbae742')
b2sums=('e6d9510058986367d66621676bf75b72cffea4d9382270328092e11a02ec57dd6095cf41b1f33a6e5ea88aea1975bcc6651490088dcd78644c5f7ae08dbf99e0')

build() {
  local cmake_options=(
    -B build
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib
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
  install -vDm 644 $pkgname-$pkgver/{{CHANGELOG,README}.mkd,RELEASE.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
