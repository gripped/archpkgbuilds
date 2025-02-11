# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2_image
pkgver=2.8.5
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg-turbo' 'libwebp' 'libavif' 'libjxl')
makedepends=('cmake')
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz"{,.sig})
sha512sums=('593f881aeaab0920df5767e77c1f7ae6daa5ea7682810f1b649645761c00ceff0533a887bdcfe2c5b226e838b19ffa7fb12df8c904746c318bd4bface96dac43'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  ./configure --disable-static --prefix=/usr \
    --disable-avif-shared \
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
