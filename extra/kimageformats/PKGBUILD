# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kimageformats
pkgver=6.0.0
pkgrel=2
pkgdesc='Image format plugins for Qt 6'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(extra-cmake-modules
             karchive
             libavif
             libheif
             libjxl
             libraw
             openexr)
optdepends=('imath: EXR format support'
            'karchive: plugin for Krita and OpenRaster images'
            'libavif: AVIF format support'
            'libheif: HEIF format support'
            'libjxl: JPEG-XL format support'
            'libraw: RAW format support'
            'openexr: EXR format support')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('1ddd28f2fb8ac2c95556f792418c2b6190a04050ac31b27aa82ea11c1af0879c'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DKIMAGEFORMATS_HEIF=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
