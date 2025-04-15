# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib
pkgver=1.2.14
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
sha512sums=('2716cc3a2299da4a1a170d734af082d78dc452b253179d0f1a9ec190140734aecf002b6924eec4ff2699ce88ce1ae5c56821c267f36384910984db726d1f9626'
            'SKIP')
b2sums=('6fee05f859a19b8ef0d9896d37442c55f602e8b4aaa7698f30c01e03a339d7a74b3214493b095a64b59ee581fb7756d903d4965e080db552e062e2001e0662ff'
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
