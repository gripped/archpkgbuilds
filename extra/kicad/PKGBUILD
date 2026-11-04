# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgbase=kicad
pkgname=('kicad' 'kicad-demos')
pkgver=10.0.8
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=(x86_64)
url='http://kicad.org/'
license=(GPL-3.0-or-later)
depends=(
  boost-libs
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
  libspnav
  wxwidgets-common
  zlib
  curl
  glm
  ngspice
  opencascade
  python
  python-wxpython
  wxwidgets-gtk3
  webkit2gtk-4.1
  unixodbc
  libgit2
  nng
  protobuf
  poppler-glib
)
makedepends=(
  git
  cmake
  ninja
  mesa
  boost
  swig
)
source=(
  "$pkgname::git+https://gitlab.com/kicad/code/kicad.git#tag=$pkgver"
  fix-version-string.patch
)
sha512sums=('d9a16f3a6c78891bb40d0f1a20b2191bb6ac64b91ebb56701426193a78f4db3f7df55ff1e0543c29a22e47b36fad99f788e438119185cd28842020e03f2bbbd7'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('d8b14baad4b39f6b1d6cca4b66d0e5ca63691b9de4f8fe0acafb955c688b8b134a6046ac664cd1e68c9b84bc212808f823b0c78cf0d0fa39407a44510751092b'
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
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D KICAD_USE_EGL=ON
    -D KICAD_BUILD_I18N=ON
    -D KICAD_I18N_UNIX_STRICT_PATH=ON
    -D KICAD_BUILD_QA_TESTS=OFF
    -D KICAD_USE_CMAKE_FINDPROTOBUF=OFF
    -D KICAD_UPDATE_CHECK=OFF
    -W no-author
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package_kicad() {
  optdepends=(
    'kicad-demos: demo projects'
    'kicad-library: for footprints, symbols and templates'
    'kicad-library-3d: for 3D models of components'
  )

  DESTDIR="$pkgdir" cmake --install build

  strip "$STRIP_SHARED" "${pkgdir}"/usr/lib/python*/site-packages/_pcbnew.so
  mv "$pkgdir/usr/share/kicad/demos" .
}

package_kicad-demos() {
  pkgdesc='Demo projects for KiCad'
  depends=('kicad' 'python')

  install -dm755 "$pkgdir/usr/share/kicad/"
  mv demos "$pkgdir/usr/share/kicad/"
}

# vim:set ts=2 sw=2 et:
