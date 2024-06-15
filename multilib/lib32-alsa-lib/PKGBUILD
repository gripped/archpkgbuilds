# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib
pkgver=1.2.12
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (32 bit)"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL-2.1-or-later)
depends=(
  lib32-gcc-libs
  lib32-glibc
  alsa-lib=$pkgver
)
provides=(
  libasound.so
  libatopology.so
)
source=(
  https://www.alsa-project.org/files/pub/lib/$_name-$pkgver.tar.bz2{,.sig}
)
sha512sums=('053e36e51c0ff28f07028b89c8845b50682a5c14035ab85c2fc8cae2f2f0d05e4cd45ed879602c15c1596fb7fe84bfd50ec0d119dfb55c66589a2d458a9b317d'
            'SKIP')
b2sums=('bcb48ad2c8687454b312e789c650136fee0db8cccf58e997b9d619aac5c74288b69220589efdcd3917eb1d781ef71be5fcd16d997c59c069fe20788d1a479068'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --without-debug
    --disable-python
  )
  # -flto=auto is not supported: https://github.com/alsa-project/alsa-lib/issues/110
  CFLAGS+=" -flto-partition=none"

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
  make -k check -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  rm -r "$pkgdir"/usr/{bin,include,share}
}
