# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2_image
pkgver=2.8.0
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg' 'libwebp' 'libavif' 'libjxl')
makedepends=('cmake')
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz"{,.sig})
sha512sums=('b58eb45e5d80a4467ca58672dd74ccf99cc84b9546ad5a3b6fca8caa4cd81351e611eef8aa98e5592f21d326358afe120a9b89e747274d7efa5f5e2c39504ff6'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  ./configure --disable-static --prefix=/usr \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-stb-image \
    --disable-tif-shared \
    --disable-jxl-shared \
    --disable-webp-shared
  make
}

package() {
  cd "${srcdir}/SDL2_image-${pkgver}/"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
