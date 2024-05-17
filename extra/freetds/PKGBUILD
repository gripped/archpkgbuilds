# Maintainer:

pkgname=freetds
pkgver=1.4.14
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
source=(https://www.freetds.org/files/stable/$pkgname-$pkgver.tar.bz2)
sha256sums=('670d5449e6d7903cc18751623adba6cd23a4b8ae01c1dc6df2bdb0bbedf0da3c')

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
