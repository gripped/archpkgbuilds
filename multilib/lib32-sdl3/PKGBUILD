# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=lib32-sdl3
pkgver=3.4.16
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) - 32-bit"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
depends=(
  'sdl3'
  'lib32-glibc'
  'lib32-libxext'
  'lib32-libxrender'
  'lib32-libx11'
  'lib32-libgl'
  'lib32-libxcursor'
  'lib32-libusb'
)
makedepends=(
  'cmake'
  'ninja'
  'jack'
  'wayland-protocols'
  'lib32-alsa-lib'
  'lib32-mesa'
  'lib32-libpulse'
  'lib32-libxrandr'
  'lib32-libxinerama'
  'lib32-wayland'
  'lib32-libxkbcommon'
  'lib32-libxss'
  'lib32-pipewire'
  'lib32-libdecor'
  'vulkan-headers'
  'lib32-sndio'
)
# TODO Maybe add 'lib32-sndio: sndio audio driver'
optdepends=(
  'lib32-alsa-lib: ALSA audio driver'
  'lib32-libpulse: PulseAudio audio driver'
  'lib32-jack: JACK audio driver'
  'lib32-pipewire: PipeWire audio driver'
  'lib32-vulkan-driver: vulkan renderer'
  'lib32-libdecor: Wayland client decorations'
)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"{,.sig})
sha512sums=('74a5ee1e5bba138a8daa710e200ac3585c60f696311c46252d86bc685c55e8271cd0d68439f8e13ca515b702d46ef58914d0f7b2352019870a5763ed79739e9a'
            'SKIP')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B') # Sam Lantinga

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL3-${pkgver} \
    -B build -G Ninja \
  	-D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib32 \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -Dm644 SDL3-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
