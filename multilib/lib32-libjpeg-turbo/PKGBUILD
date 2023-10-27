# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

_name=libjpeg-turbo
pkgname=lib32-$_name
pkgver=3.0.1
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
arch=(x86_64)
license=(
  BSD-3-Clause
  IJG
  Zlib
)
depends=(
  lib32-glibc
  $_name=$pkgver
)
makedepends=(
  cmake
  ninja
  nasm
)
provides=(
  lib32-libjpeg
  libjpeg.so
  libturbojpeg.so
)
source=(
  https://sourceforge.net/projects/$_name/files/$pkgver/$_name-$pkgver.tar.gz{,.sig}
)
sha512sums=('26a2c821a023579e82a7c2a00582747f5f24089aa0820ba304f1ff71c6894b7a6bd0468acc5ff90e2655e0a1c23a5a35a779df51f5cfa3e9eba527c709fab55b'
            'SKIP')
b2sums=('9d2c784edd6493c4d9e2379fc4a8f0844e440d7afe774b231f611034d481dcf1be35979fb7d731a5a8f99000780f1343b7934a59df22c1dcaef295b6294ea494'
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

  install -vDm 644 $_name-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
