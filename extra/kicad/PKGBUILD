# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgname=kicad
pkgver=9.0.8
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=(x86_64)
url='http://kicad.org/'
license=(GPL-3.0-or-later)
depends=(
  fontconfig
  zstd
  abseil-cpp
  freetype2
  hicolor-icon-theme
  libsecret
  glibc
  glib2
  gtk3
  wayland
  glu
  cairo
  harfbuzz
  libstdc++
  libgcc
  libglvnd
  wxwidgets-common
  zlib
  curl
  glm
  ngspice
  opencascade
  python
  python-wxpython
  wxwidgets-gtk3
  unixodbc
  libgit2
  nng
  protobuf
)
makedepends=(
  git
  cmake
  ninja
  mesa
  boost
  swig
)
optdepends=(
  'kicad-library: for footprints, symbols and templates'
  'kicad-library-3d: for 3D models of components'
)
source=(
  "$pkgname::git+https://gitlab.com/kicad/code/kicad.git#tag=$pkgver"
  fix-version-string.patch
)
sha512sums=('4b3c155a60597fe513736c675d86b317cf2dd2db9e5b953ebebe7a898f436dfbf6a825127290ff4936956364a6bcd34dbee505b6d1b42a95947c29514e5f12c7'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('f426f48e194fb4f99033e643ca45b17578f7f97df70d3dc81eecc7bd1dc3c8ed017f60f540438feeefa2ea3d643458fe8642803d16134e35dbdee38b5aac19de'
        '7e09300161b2a1d7af56580a195e3b132d7b6ad82f1c9c381e02a25cd2fabd7ed0cd33b99b87ca14f9f77dad26eee1e5ea962b6eca49bacb40567ecfc24c21ff')


prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/fix-version-string.patch"
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D KICAD_USE_EGL=ON
    -D KICAD_BUILD_I18N=ON
    -D KICAD_I18N_UNIX_STRICT_PATH=ON
    -D KICAD_BUILD_QA_TESTS=OFF
    -D KICAD_USE_CMAKE_FINDPROTOBUF=OFF
    -W no-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  strip "$STRIP_SHARED" "${pkgdir}"/usr/lib/python*/site-packages/_pcbnew.so
}

# vim:set ts=2 sw=2 et:
