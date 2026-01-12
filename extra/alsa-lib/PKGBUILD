# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib
pkgver=1.2.15.2
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL-2.1-or-later)
depends=(
  alsa-topology-conf
  alsa-ucm-conf
  glibc
)
provides=(
  libasound.so
  libatopology.so
)
install=$pkgname.install
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
)
sha512sums=('e9a13aafa9693be2ce501059db0ff9f83a0044d07019bd6b420617da44cc4e7df6f444da9eccf37577893ed81426dce44ecdb9a652d1db047e24a3b803da4a8a'
            'SKIP')
b2sums=('bc58d48ec5da704b2d19919c608c07454c126565d7a13f66b9af73a47e6212a7659645b560c0825f46d96b74bc5d49d055e15c32bb88511044efc27bb7801b58'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  # -flto=auto is not supported: https://github.com/alsa-project/alsa-lib/issues/110
  CFLAGS+=" -flto-partition=none"
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --without-debug
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  export LD_LIBRARY_PATH="$pkgname-$pkgver/src/.libs/:$LD_LIBRARY_PATH"
  make -k check -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}
