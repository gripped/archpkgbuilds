# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib
pkgver=1.2.15.1
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
sha512sums=('36d79055537cf516dd435db56559ee59f3efbbea72ae0dbe5244191cfba4e181ed13100d908eb51bfd3a3be70aa87081df9b56921e7d24c3b3728e4374507236'
            'SKIP')
b2sums=('96910ecadafdf5bd12d98c765598f06f7dda94cdfb554e972663b77dc19646700962d6984a228a652f0fb3339e8dc44565d3695aa06971e084f5b951793679e1'
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
