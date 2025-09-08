# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lib32-libjpeg-turbo
_name=${pkgname#lib32-}
pkgver=3.1.2
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
_url="https://github.com/libjpeg-turbo/libjpeg-turbo/"
arch=(x86_64)
license=(
  BSD-3-Clause
  IJG
)
depends=(
  lib32-glibc
  $_name=$pkgver
)
makedepends=(
  cmake
  lib32-expat
  ninja
  nasm
)
provides=(
  libjpeg.so
  libturbojpeg.so
)
source=(
  $_url/releases/download/$pkgver/$_name-$pkgver.tar.gz{,.sig}
)
sha512sums=('79271ae4ddc12e3753cc7323dc15617f1d82b2d554ef27b555712f6ab5de603323dd33747620815e3b55663a20e07b292a55172aee9f401f9fd3557145967abe'
            'SKIP')
b2sums=('476280f1140977903e177667184452b8ec79a930cd0dbcfc10f46c682c85e2daf38ff8a4267590859eb845a9273fc91b19a61168b7e2c5229d7ed4c18100b2dd'
        'SKIP')
validpgpkeys=('0338C8D8D9FDA62CF9C421BD7EC2DBB6F4DBF434') # The libjpeg-turbo Project (Signing key for official binaries) <information@libjpeg-turbo.org>

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=/usr/lib32
    -D CMAKE_BUILD_TYPE=None
    -D ENABLE_STATIC=OFF
    -D WITH_JAVA=OFF
    -D WITH_JPEG8=ON
    -G Ninja
    -S $_name-$pkgver
    -W no-dev
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cmake "${cmake_options[@]}"
  cmake --build build -v
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build -v

  # remove everything that is provided by libjpeg-turbo
  rm -r "$pkgdir"/usr/{include,share,bin}

  install -vDm 644 $_name-$pkgver/{LICENSE.md,README.ijg} -t "$pkgdir/usr/share/licenses/$pkgname/"
}
