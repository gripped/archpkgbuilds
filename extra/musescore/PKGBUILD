# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore
pkgver=4.4.4
pkgrel=4
pkgdesc='Create, play and print beautiful sheet music'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  harfbuzz
  hicolor-icon-theme
  libasound.so
  libfreetype.so
  libopusenc
  libsndfile.so
  opus
  qt6-5compat
  qt6-base
  qt6-declarative
  qt6-networkauth
  qt6-scxml
  qt6-svg
  tinyxml2
  zlib
  zstd
)
makedepends=(
  cmake
  doxygen
  git
  lame
  ninja
  python
  qt6-tools
)
optdepends=('lame: MP3 export')
options=(!lto)
source=(git+https://github.com/musescore/MuseScore.git#tag=v${pkgver})
sha256sums=('470c1ab07e0ef613943a8c296c5bdc330da46c77ecbf918ccd90ad3c87786316')

build() {
  cmake -S MuseScore -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DMUSE_APP_BUILD_MODE=release \
    -DMUSESCORE_BUILD_CONFIGURATION=app \
    -DMUSESCORE_REVISION=$(git rev-parse --short=7 HEAD) \
    -DMUE_BUILD_UNIT_TESTS=OFF \
    -DMUE_COMPILE_USE_SYSTEM_FLAC=ON \
    -DMUE_COMPILE_USE_SYSTEM_FREETYPE=ON \
    -DMUE_COMPILE_USE_SYSTEM_HARFBUZZ=ON \
    -DMUE_COMPILE_USE_SYSTEM_OPUS=ON \
    -DMUE_COMPILE_USE_SYSTEM_OPUSENC=ON \
    -DMUE_COMPILE_USE_SYSTEM_TINYXML=ON \
    -DMUE_ENABLE_FILE_ASSOCIATION=ON \
    -DMUE_INSTALL_SOUNDFONT=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin/crashpad_handler,include,lib}
}

# vim: ts=2 sw=2 et:
