# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=1.1.1
pkgrel=2
pkgdesc='Application to split, merge, rotate and mix PDF files'
arch=('x86_64')
url='https://scarpetta.eu/pdfmixtool/'
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qpdf' 'imagemagick' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        ImageMagick-7.1.1.patch
        qpdf-12.0.0.patch)
sha256sums=('13fe771e8bb724d77a888443b3c6196cb9f81a6de5ef41351a111123e848e267'
            '085bb271ae8b780fdc5d7f77f454a0f6d5b80b7a914a1576d3768f39bbbd9809'
            'SKIP')

prepare() {
  # Update URL
  sed -i 's/scarpetta.gitlab.io/scarpetta.eu/' $pkgname-v$pkgver/resources/eu.scarpetta.PDFMixTool.appdata.xml

  # fix build
  cd $pkgname-v$pkgver
  patch -Np1 -i ../ImageMagick-7.1.1.patch
  patch -Np1 -i ../qpdf-12.0.0.patch
}

build() {
  cmake -S $pkgname-v$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr' -DQT_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
