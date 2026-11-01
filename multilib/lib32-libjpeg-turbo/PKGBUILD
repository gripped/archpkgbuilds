# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lib32-libjpeg-turbo
_name=${pkgname#lib32-}
pkgver=3.2.1
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
sha512sums=('8a0be9e42f4dd0634d61ec76b959f8942c70237848bb2854baad8abd352483784b7c4f099823368fb3e40be5d9200fb4b2574aecdcebf225d74b09dc217948eb'
            'SKIP')
b2sums=('eeae531ca1dd7665f72e97eb77d47f00251e965758cc6808434082b13c9ef193a86de9281a2e1c541339d00a8641d324452a8654c39e10c45530f5ea39175b5c'
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
