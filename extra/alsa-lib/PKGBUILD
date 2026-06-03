# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib
pkgver=1.2.16
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
sha512sums=('988faee3dcf08f51ce2dacb924cf0dcddeae3e713d13f814fa53dbdeca77ce5966bfad3c8711788c7f56327fb61d432b234127388372621897cb34f983d8cd31'
            'SKIP')
b2sums=('8035344deb834c7af65d8f85b45af364c827fd721cf95792f022847ca7ea634cf13aea4a8b138d276e19da548a42fb51e22dadb4784d83ab1764787b63dd263f'
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
