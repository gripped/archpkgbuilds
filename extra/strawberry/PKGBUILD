# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=1.2.29
pkgrel=2
pkgdesc='A music player aimed at audio enthusiasts and music collectors'
arch=(x86_64)
url='https://www.strawberrymusicplayer.org/'
license=(GPL-3.0-or-later)
depends=(alsa-lib
         chromaprint
         fftw
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
         libgcc
         libgpod
         libmtp
         libpulse
         libstdc++
         libx11
         openssl
         qt6-base
         sqlite
         taglib
         udisks2)
makedepends=(boost
             cmake
             git
             qt6-tools
             rapidjson
             sparsehash)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=(git+https://github.com/strawberrymusicplayer/strawberry#tag=$pkgver
        https://github.com/strawberrymusicplayer/strawberry/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('909523daf62e4f7ab533a1f5ffb44debae2f531a51ffabfd1d02793c45fb9f86'
            'f5fa02477e25cf1b2d501ee1b0a31521fc7ba74ea13055ab5f934793eb7dc264')

prepare() {
# Get API credentials from release tarball
  cp $pkgname-$pkgver/src/apicredentials.h $pkgname/src
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
