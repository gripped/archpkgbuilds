# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=aqbanking
pkgver=6.6.1
pkgrel=1
pkgdesc="A library for online banking and financial applications"
arch=('x86_64')
url="https://www.aquamaniac.de/rdm/projects/aqbanking"
license=('GPL')
depends=('gwenhywfar')
options=('!makeflags')
source=(https://www.aquamaniac.de/rdm/attachments/download/535/$pkgname-$pkgver.tar.gz
        https://www.aquamaniac.de/rdm/attachments/download/534/$pkgname-$pkgver.tar.gz.asc)
validpgpkeys=('42400AF5EB2A17F0A69BB551E9899D784A977416') #AqBanking Package Key <packages@aqbanking.de>
sha256sums=('3250fa6d893f816d29c19af35fe5fccb74c080e21753fd9e52579a792dd48567'
            'SKIP')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  BUILD_DATE="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d%H%M%S)"

  export PKG_CONFIG=/usr/bin/pkg-config
  ./configure --prefix=/usr --enable-gwenhywfar \
              --with-build-datetime=${BUILD_DATE} \
              --with-backends="aqhbci aqofxconnect aqpaypal aqnone" # aqnone https://www.aquamaniac.de/rdm/issues/258
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
