# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2-compat
pkgver=2.32.54
pkgrel=2
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
sha512sums=('857aee92ab78692b9d9fb1734ee8d0bd59cff6d427a4aef8406e98858182299420d1f129676ad9a939e2b263fe7c78991a0a9ff955bae920f5530919a1f9a0ea'
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
  ln -s sdl2-compat.pc "${pkgdir}/usr/lib/pkgconfig/sdl2.pc"

  install -Dm644 "sdl2-compat-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
