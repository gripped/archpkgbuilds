# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lib32-libjpeg-turbo
_name=${pkgname#lib32-}
pkgver=3.0.3
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
  lib32-libjpeg
  libjpeg.so
  libturbojpeg.so
)
source=(
  $_url/releases/download/$pkgver/$_name-$pkgver.tar.gz{,.sig}
)
sha512sums=('7c3a6660e7a54527eaa40929f5cc3d519842ffb7e961c32630ae7232b71ecaa19e89dbf5600c61038f0c5db289b607c2316fe9b6b03d482d770bcac29288d129'
            'SKIP')
b2sums=('9d141dadd0dce970bf857b51352c57a8e15180438abd7d6d66f9dfd24e23889add8c6c89120b84026e40ab61611516b0567984bd1db37e9c45b41917cf32e9a6'
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
