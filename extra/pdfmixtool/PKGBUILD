# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=1.2.1
pkgrel=1
pkgdesc='Application to split, merge, rotate and mix PDF files'
arch=('x86_64')
url='https://scarpetta.eu/pdfmixtool/'
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qpdf' 'imagemagick' 'qt6-svg' 'poppler-qt6')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('0ea40d4d850f7dcc254ab02ec27544ad0c8f411a16f1faeb4503e447a4ea034d')

build() {
  cmake -S $pkgname-v$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
