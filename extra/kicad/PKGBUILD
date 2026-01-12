# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgname=kicad
pkgver=9.0.7
pkgrel=4
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
  gcc-libs
  libglvnd
  wxwidgets-common
  zlib
  curl
  glew
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
sha512sums=('22ee00b58cb5fc6eb6df8194a1f750acc4f9d8cb3cb9bedd12c9a847a261631e35ffa6e18335081595e397731e5aeb6383a91cc77af5bef05e8acceb111444d8'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('61739a6d9523ad4efe2a4801aa43398f5f91e9d4ae0456ac5a88ddaed4b0be46bbfc02c3a9212543bcf3839844decf6806ab49970a29a3c71cecb7868f62ba34'
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
    -D KICAD_USE_BUNDLED_GLEW=OFF
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
