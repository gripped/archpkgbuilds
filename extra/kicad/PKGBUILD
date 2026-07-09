# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

pkgbase=kicad
pkgname=('kicad' 'kicad-demos')
pkgver=10.0.4
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
sha512sums=('151dbdcc9452368df6c5336d323affea8bdea7ec0e25cbff970d7cdf2f2a71778f69aa96eec697b9339f83431d1319f7167dbbcf8e76b53c0f31fbddd7f6bd48'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5')
b2sums=('6f27957d22432e71dd82b1e7ea4df7f19b85a4a5850e5ab31613456729ddc4250938ec6b399d73ca6c1ea9ae032e141166e3684f3ab59db4c69313c5a3b3c137'
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
