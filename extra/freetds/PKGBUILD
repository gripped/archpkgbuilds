# Maintainer:

pkgname=freetds
pkgver=1.4.11
pkgrel=1
pkgdesc='Library for accessing Sybase and MS SQL Server databases'
url='https://www.freetds.org'
arch=(x86_64)
license=(LGPL)
depends=(glibc
         krb5
         openssl
         readline
         unixodbc)
backup=(etc/freetds/freetds.conf
        etc/freetds/locales.conf
        etc/freetds/pool.conf)
source=(ftp://ftp.freetds.org/pub/freetds/stable/$pkgname-$pkgver.tar.bz2)
sha256sums=('567f7ce913f222191dda7e1c221d5e272a387152fef6cacbd97767fea68b613e')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/freetds \
    --enable-msdblib \
    --enable-krb5 \
    --with-unixodbc=/usr \
    --with-openssl
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
