# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgname=kicad
pkgver=9.0.1
pkgrel=2
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=('x86_64')
url='http://kicad.org/'
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'glew'
  'glm'
  'ngspice'
  'opencascade'
  'python'
  'python-wxpython'
  'wxwidgets-gtk3'
  'unixodbc'
  'libgit2'
  'nng'
  'protobuf'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'mesa'
  'boost'
  'swig'
)
optdepends=(
  'kicad-library: for footprints, symbols and templates'
  'kicad-library-3d: for 3D models of components'
)
source=(
  "$pkgname::git+https://gitlab.com/kicad/code/kicad.git#tag=$pkgver"
  'fix-version-string.patch'
)
sha512sums=('be82bf2202353ff8ec5ea85fc817090ad0ae5c463d6cc5b8c6ad9a94ad2c45d9c1f5636ad5aca5c47e3a605777541bbff8ba9f5890ec65b6c6bf03f3fb454c17'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('2d750fbb78296c2fe1d609cbf41a53b87328300b58d805eb0609c4d6df29ab5443297db0abdaf43938f4fdf87eba606a77a1b3b7967451980042e697a8774d3a'
        '7e09300161b2a1d7af56580a195e3b132d7b6ad82f1c9c381e02a25cd2fabd7ed0cd33b99b87ca14f9f77dad26eee1e5ea962b6eca49bacb40567ecfc24c21ff')


prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/fix-version-string.patch"
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D KICAD_USE_EGL=ON \
    -D KICAD_USE_BUNDLED_GLEW=OFF \
    -D KICAD_BUILD_I18N=ON \
    -D KICAD_I18N_UNIX_STRICT_PATH=ON \
    -D KICAD_BUILD_QA_TESTS=OFF \
    -D KICAD_USE_CMAKE_FINDPROTOBUF=0 \
    -W no-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  strip "$STRIP_SHARED" "${pkgdir}"/usr/lib/python*/site-packages/_pcbnew.so
}

# vim:set ts=2 sw=2 et:
