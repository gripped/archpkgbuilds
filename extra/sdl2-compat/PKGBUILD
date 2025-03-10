# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2-compat
pkgver=2.32.52
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
sha512sums=('dfb57dc384bc20361cdd2557f6e1fb09319c1b0226ba14e89678ad7f217e4ba438058b8a8a5508ab04f3163b3fa1655b0fbbb9bb6e26f01d2304813d64120adf'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

build() {
  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s sdl2_compat.pc "${pkgdir}/usr/lib/pkgconfig/sdl2.pc"

  install -Dm644 "sdl2-compat-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
