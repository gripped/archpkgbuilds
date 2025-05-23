# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgname=calf
pkgver=0.90.7
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
b2sums=('388ba85a76fc47805c5ad6e3157ef4cb604cf9b634704ba1c9dc9978a40f6f8f38d170a7461fc83b5ce4527e9a0bfb6eb07a8a606cce45dcfa1673032b5345cb')

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
