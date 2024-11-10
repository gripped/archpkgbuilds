# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=1.2.0
pkgrel=3
pkgdesc='A music player aimed at audio enthusiasts and music collectors'
arch=(x86_64)
url='https://www.strawbs.org/'
license=(GPL-3.0-or-later)
depends=(abseil-cpp
         alsa-lib
         chromaprint
         fftw
         gcc-libs
         gdk-pixbuf2
         glib2
         glibc
         gst-plugins-base
         gst-plugins-base-libs
         gst-plugins-good 
         gstreamer
         icu
         kdsingleapplication
         libcdio
         libebur128
         libgpod
         libmtp
         libpulse
         libx11
         protobuf
         qt6-base
         sqlite
         taglib
         udisks2)
makedepends=(boost
             cmake
             git
             qt6-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=(git+https://github.com/strawberrymusicplayer/strawberry#tag=$pkgver)
sha256sums=('39b0a9f0710e6eb2a4f47df181dc6bbc26cdb06fee54ac9dc0f4c391371d9f31')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
