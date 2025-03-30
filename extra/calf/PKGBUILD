# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgname=calf
pkgver=0.90.6
pkgrel=1
pkgdesc='LV2 plug-in suite and standalone Jack host'
arch=(x86_64)
url='https://calf-studio-gear.org'
_url="https://github.com/calf-studio-gear/calf"
groups=(
  lv2-plugins
  pro-audio
)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
depends=(
  cairo
  expat
  fluidsynth
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk2
  hicolor-icon-theme
  jack)
makedepends=(
  cmake
  git
  lv2
)
source=("git+$_url#tag=$pkgver")
b2sums=('4354d2a09518563725940d48c581d4e14ccb8fba15e40b615ed25511650f9c41a1c71f942f3861e5eae2d987968f6e8f8f9ae2dfb54753126d3089f725004a7c')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D WANT_EXPERIMENTAL=ON
    -S $pkgname
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/{AUTHORS,ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
