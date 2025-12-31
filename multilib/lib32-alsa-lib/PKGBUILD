# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib
pkgver=1.2.15.1
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
sha512sums=('36d79055537cf516dd435db56559ee59f3efbbea72ae0dbe5244191cfba4e181ed13100d908eb51bfd3a3be70aa87081df9b56921e7d24c3b3728e4374507236'
            'SKIP')
b2sums=('96910ecadafdf5bd12d98c765598f06f7dda94cdfb554e972663b77dc19646700962d6984a228a652f0fb3339e8dc44565d3695aa06971e084f5b951793679e1'
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
