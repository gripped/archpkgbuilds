# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=1.6.3
pkgrel=2
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/cherrytree/"
license=('GPL-3.0-or-later')
depends=(
  'atkmm'
  'cairo'
  'cairomm'
  'curl'
  'fmt'
  'fribidi'
  'glib2'
  'glibc'
  'glibmm'
  'gspell'
  'gtk3'
  'gtkmm3'
  'gtksourceview4'
  'hicolor-icon-theme'
  'libgcc'
  'libsigc++'
  'libstdc++'
  'libxml++2.6'
  'libxml2'
  'pango'
  'pangomm'
  'sqlite'
  'uchardet'
  'vte3'
)
makedepends=(
  'cmake'
  'python'
  'spdlog'
)
checkdepends=(
  'aspell'
  'hspell'
  'hunspell'
  'libvoikko'
  'nuspell'
  'texlive-bin'
  'texlive-basic'
  'xorg-server-xvfb'
)
source=("https://github.com/giuspen/cherrytree/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.xz"{,.asc}
         glycin-2.patch)
b2sums=('87ca6591e418eb151eaaaaaf21fb1575de012ca4e1b90528210e1980f1af9c3a35928f1a0abea842c6f30873a566ed771dccc22905bb20211fff78334bb60fb1'
        'SKIP'
        'fc7d69f1f771feee9ce65cb4bc78a4dd5dfc8cc1575b51d95ab9157126bd6cfa7f679b3367db2c947fbfaf99a8ca2dea11fedb3fcbc0760c8ea7262c301bddee')
validpgpkeys=('C7BF38CE0BD442C2369AA984049128A20CE0648D') # Giuseppe Penone <giuspen [at] gmail [dot] com>

prepare() {
  cd ${pkgname}_${pkgver}
  patch -p1 -i ../glycin-2.patch # Adapt tests to glycin 2 decoders output
}

build() {
  cmake -B build -S "${pkgname}_${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DINSTALL_GTEST:BOOL=OFF \
    -DAUTO_RUN_TESTING:BOOL=OFF
  cmake --build build
}

check() {
  xvfb-run build/run_tests_with_x_1
  xvfb-run build/run_tests_with_x_2
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
