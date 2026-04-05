# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lib32-libjpeg-turbo
_name=${pkgname#lib32-}
pkgver=3.1.4.1
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
sha512sums=('d82c2c2bd8abb1b88a245cece407a4cf65c378003e105a99a20ae4e7e3a7282b64874c3e7d8c003e83b43c990d43f860066e6ac57c143f8b3b9732d6bca7d94a'
            'SKIP')
b2sums=('7e38379b4e3bb168e6ec081be5852f9a7f4680929d42e5cccb0c00632130eee9200afdc9c2ed99250c3ddfc1cd8dd21f60da54e6c48157884c9173ae1b3f9a9f'
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
