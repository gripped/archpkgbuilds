# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib
pkgver=1.2.14
pkgrel=2
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
  update-midifile-library-to-ANSI-C.patch
)
sha512sums=('2716cc3a2299da4a1a170d734af082d78dc452b253179d0f1a9ec190140734aecf002b6924eec4ff2699ce88ce1ae5c56821c267f36384910984db726d1f9626'
            'SKIP'
            'da9e8bde4eef1def49a627089b579d93b2487b08c13dbfaeeebe20e21f24689760b1c4b007e1c23894afa470bb09ebab2a611363e185cf7685f7ae8b83c8b240')
b2sums=('6fee05f859a19b8ef0d9896d37442c55f602e8b4aaa7698f30c01e03a339d7a74b3214493b095a64b59ee581fb7756d903d4965e080db552e062e2001e0662ff'
        'SKIP'
        'c5cbd73d174ca9698f0769f4cd6ffe25591dda36beb4fbb4e51bf89b3ca60c553b59d51b11975442afd40996b4cc72626727be44090844dfd48366af13740044')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ../update-midifile-library-to-ANSI-C.patch
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
