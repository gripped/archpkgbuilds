# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=1.2.2
pkgrel=1
pkgdesc='A music player aimed at audio enthusiasts and music collectors'
arch=(x86_64)
url='https://www.strawbs.org/'
license=(GPL-3.0-or-later)
depends=(alsa-lib
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
sha256sums=('fdb7742ff07cf3924a3350861b64f9941d3c19accaff507e9dddb88933549245')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
