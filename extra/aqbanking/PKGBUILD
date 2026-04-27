# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=aqbanking
pkgver=6.9.1
pkgrel=3
pkgdesc="A library for online banking and financial applications"
arch=('x86_64')
url="https://www.aquamaniac.de/rdm/projects/aqbanking"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'gmp'
  'gwenhywfar'
  'libxml2'
  'xmlsec'
  'zlib'
)
provides=('libaqbanking.so')
source=(
  "https://www.aquamaniac.de/rdm/attachments/download/652/$pkgname-$pkgver.tar.gz"
  "https://www.aquamaniac.de/rdm/attachments/download/651/$pkgname-$pkgver.tar.gz.asc"
)
b2sums=('eab21b93e6f03ca26a66545e4d15e5df399d8c61f4f27282daf97437f73503f54cb2b98c539642e6e2b56b7ed3b54a5f70782ec2232b613f857fa53afceb38cf'
        'SKIP')
validpgpkeys=('42400AF5EB2A17F0A69BB551E9899D784A977416') # AqBanking Package Key <packages@aqbanking.de>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-gwenhywfar \
    --with-build-datetime="@$SOURCE_DATE_EPOCH"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
