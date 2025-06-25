# Maintainer:

pkgname=freetds
pkgver=1.5.4
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
sha256sums=('1d024ef418d74a3a8f2cca82f10f1561f1dde28dc3d6f65c815f07764d4f7ea8')

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
