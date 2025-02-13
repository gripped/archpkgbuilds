# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dominik Ryba <domryba@post.pl>

pkgname=hugin
pkgver=2024.0.1
pkgrel=5
pkgdesc="Panorama photo stitcher"
arch=(x86_64)
url="http://hugin.sourceforge.net/"
license=(GPL-2.0-only)
depends=(boost-libs
         enblend-enfuse
         exiv2
         fftw
         glew
         glu
         lapack
         lcms2
         lensfun
         libjpeg-turbo libjpeg.so
         libpano13
         libpng
         libtiff
         libxi
         libxmu
         openexr
         python
         sqlite
         vigra
         wxwidgets-gtk3)
makedepends=(boost
             cmake
             dos2unix
             mesa
             python-setuptools
             swig
             tclap)
optdepends=('darktable: RAW import using darktable'
            'dcraw: RAW import using dcraw'
            'perl-image-exiftool: GPano tags support'
            'rawtherapee: RAW import using rawtherapee')
_archive="$pkgname-$pkgver"
source=("https://downloads.sourceforge.net/$pkgname/$_archive.tar.bz2"
        ignore_gzip_timestamps.patch)
sha256sums=('13ec0cdeeb4eb63149c833768d3e374e7cf5a6a8d8d02d50885ce496f05ba7e4'
            'e6a41ce195c55f0c895a359203c84c47e885dbbd98c9b077c9a5e092be3bafb4')

prepare() {
# Fix build with boost 1.85
  sed -e 's|copy_option::overwrite_if_exists|copy_options::overwrite_existing|' -i $_archive/src/hugin_base/hugin_utils/filesystem.h

# Ignore timestamps recording in gzip metadata
# This is required for reproducible builds
  cd "$_archive"
  patch -Np1 -i "$srcdir/ignore_gzip_timestamps.patch"
}

build() {
  cmake -B build -S "$_archive" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_LAPACK=yes \
    -DBUILD_HSI=ON \
    -DUSE_GDKBACKEND_X11=ON
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
