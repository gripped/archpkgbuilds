# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgbase=kicad
pkgname=('kicad' 'kicad-demos')
pkgver=10.0.1
pkgrel=2
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
sha512sums=('292fb262d7c526f7e9efc41f75f2119f71d98aeaf8eea9f7d01ee5a123035ef6463e0b21f9f271d55f2cadcd3038210c460ceccb68c66f22b0481711e5e67c03'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('2f7c58dc03c2b351ef92a3afeb7a1bcfe53adbdf3f07b51a9fda7194e9da611e62a55c696c8c56f98b8f150b8ab1f1692612a77a3101b914829d12491a1eba4c'
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
    -D KICAD_UPDATE_CHECK=OFF
    -W no-dev
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
