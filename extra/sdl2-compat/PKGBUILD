# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2-compat
pkgver=2.32.64
pkgrel=1
pkgdesc="An SDL2 compatibility layer that uses SDL3 behind the scenes"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('sdl3' 'glibc')
makedepends=('cmake' 'ninja')
arch=('x86_64')
conflicts=('sdl2')
provides=("sdl2=${pkgver}")
replaces=('sdl2')
license=('Zlib')
source=("https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}.tar.gz"{,.sig})
sha512sums=('22c73c794bc2a750d7ec1a3fa16db9e63af4e058f96975b27f856a89a91760596f54899b22d2d8ae3f5a9a6e7f58a37870965d540761212f6c746a8f4fc2e775'
            'SKIP')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B') # Sam Lantinga


build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s sdl2-compat.pc "${pkgdir}/usr/lib/pkgconfig/sdl2.pc"

  install -Dm644 "sdl2-compat-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
