# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=1.3.0
pkgrel=1
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
  'gcc-libs'
  'glib2'
  'glibc'
  'glibmm'
  'gspell'
  'gtk3'
  'gtkmm3'
  'gtksourceview4'
  'hicolor-icon-theme'
  'libsigc++'
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
  'texlive-core'
  'xorg-server-xvfb'
)
source=("https://github.com/giuspen/cherrytree/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.xz"{,.asc})
sha512sums=('e7b061aed33ad55c1fc7f7dd43b01db6c36ba414c32f996c86c9a64899e6d0cf7825637350c8dcf252d5495b8d956a675b34607854177d6f01615ad9d4953c78'
            'SKIP')
validpgpkeys=('C7BF38CE0BD442C2369AA984049128A20CE0648D') # Giuseppe Penone <giuspen [at] gmail [dot] com>

build() {
  cmake -B build -S "${pkgname}_${pkgver}" \
  -DINSTALL_GTEST:BOOL='OFF' \
  -DAUTO_RUN_TESTING:BOOL='OFF' \
  -DCMAKE_BUILD_TYPE='None' \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -Wno-dev
  cmake --build build
}

check() {
  xvfb-run build/run_tests_with_x_1
  xvfb-run build/run_tests_with_x_2
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
