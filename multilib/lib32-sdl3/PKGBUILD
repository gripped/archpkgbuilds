# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=lib32-sdl3
pkgver=3.2.12
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
sha512sums=('661f588d0134b32d85eb565f8a03409a2561089595f125660a1815fa245bef58daf4f24b273d33227996858ed2d5ef4cc53003704be3f27dd81f207d8202a7e4'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL3-${pkgver} \
    -B build -G Ninja \
  	-D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
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
