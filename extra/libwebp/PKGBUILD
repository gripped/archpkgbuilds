# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp
pkgver=1.3.1
pkgrel=2
pkgdesc="WebP library and conversion tools"
url="https://developers.google.com/speed/webp/"
arch=(x86_64)
license=(BSD)
depends=(
  giflib
  libjpeg
  libpng
  libtiff
)
makedepends=(
  cmake
  ninja
)
provides=(
  libsharpyuv.so
  libwebp{,decoder,demux,mux}.so
)
source=(
  https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz{,.asc}
  CVE-2023-4863.patch
)
sha256sums=('b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66'
            'SKIP'
            'f5f69bcc54a1bb18e2df22f7fa94af7569f7d5150d9a18738ea43a999b552f06')
b2sums=('e3f0b66f98fb5add22653b0f8d7f7f5fff9df4e60eff221da78dda1a13d3a5b9da684d37dd0756dff52b1225c5ee04a54be95c008c34033bbe9fa824cbab7cee'
        'SKIP'
        '2661d2b4df6184b218832ede2794a7a8a68117eb3a4e89445f4c001e9f1064be90b9ea0d0ec53ac197d192607c306d4d5e77d34ff3736c8d1bdc848b0d383e9e')
validpgpkeys=(
  6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D # WebP release signing key
)

prepare() {
  cd libwebp-$pkgver
  patch -Np3 -i ../CVE-2023-4863.patch
}

build() {
  local cmake_options=(
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DWEBP_BUILD_EXTRAS=OFF
    -DWEBP_BUILD_VWEBP=OFF
  )

  # Mimic autotools build without --enable-asserts
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  cmake -S libwebp-$pkgver -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    libwebp-$pkgver/COPYING
}

# vim:set sw=2 sts=-1 et:
