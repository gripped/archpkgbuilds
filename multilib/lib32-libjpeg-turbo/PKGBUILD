# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

_name=libjpeg-turbo
pkgname=lib32-$_name
pkgver=3.0.2
pkgrel=2
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
sha512sums=('f5eadda0712feb810a8c3bb2621fda24a4c30574998ce30f423b3ffa25225c7a87cb14b696232bc0270485f422a2853a5c32eafb65bc5eeab1b41d8aeb32ad29'
            'SKIP')
b2sums=('b6eff81657707852ee9ea81099179c6e20914f513fd32b12b1bfbf5233f850f54a1062a98150044aa34476f0c54e42a67c88633a59834a764d3f8bb394f374f0'
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
