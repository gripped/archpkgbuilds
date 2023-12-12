# Maintainer: 
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=1.0.3
pkgrel=1
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/cherrytree/"
license=('GPL3')
depends=('fmt' 'gspell' 'gtksourceviewmm' 'libxml++2.6' 'uchardet' 'vte3')
makedepends=('cmake' 'python' 'spdlog')
checkdepends=('xorg-server-xvfb')
source=("https://github.com/giuspen/cherrytree/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.xz"{,.asc})
sha512sums=('63ff1506a03035d989a3fc39c4549e8aea8401f7f1943970b24380ae5decab2df456925a293d03de003bbe8e342c6414d1e380cf6663d93158aa37121c27b4a2'
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
