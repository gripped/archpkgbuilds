# Maintainer:

pkgname=freetds
pkgver=1.5.22
pkgrel=1
pkgdesc='Library for accessing Sybase and MS SQL Server databases'
url='https://www.freetds.org'
arch=(x86_64)
license=(GPL-2.0-only
         LGPL-2.0-only)
depends=(glibc
         krb5
         openssl
         readline
         unixodbc)
backup=(etc/freetds/freetds.conf
        etc/freetds/locales.conf
        etc/freetds/pool.conf)
source=(https://www.freetds.org/files/stable/$pkgname-$pkgver.tar.bz2)
sha256sums=('b31cbc50f9e2ad4adf8dd3958807e4e7b8f4e588b080f8dbddbe465ceefb9231')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/freetds \
    --enable-msdblib \
    --enable-krb5 \
    --with-unixodbc=/usr \
    --with-openssl
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Avoid overlinking
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
