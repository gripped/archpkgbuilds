# Maintainer:

pkgname=freetds
pkgver=1.4.15
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
sha256sums=('df61a14e155a2e322409f1c068f5ad663649f029a4ecb33a2841f1552608ac48')

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
