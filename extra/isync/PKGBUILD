# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Mark Pustjens <pustjens@dds.nl>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=isync
pkgver=1.5.1
pkgrel=3
pkgdesc="IMAP and MailDir mailbox synchronizer"
arch=('x86_64')
url="https://isync.sourceforge.io/"
license=('GPL2')
depends=('libsasl' 'zlib' 'db5.3')
source=(https://downloads.sourceforge.net/sourceforge/isync/$pkgname-$pkgver.tar.gz
        https://downloads.sourceforge.net/sourceforge/isync/$pkgname-$pkgver.tar.gz.asc
        openssl4.patch)
sha256sums=('28cc90288036aa5b6f5307bfc7178a397799003b96f7fd6e4bd2478265bb22fa'
            'SKIP'
            'e481f2a975f88f648624a05df3c020771ad44915dd2d5252c8ad9819ad26ec41')
validpgpkeys=('96DD32BFBF9FAB04B0D95305AA283E0B2F1BB1D1'
              '63BFD037CAD71E8DFF3AEA3AC17714F08D1BDBBA')

prepare() {
  cd $pkgname-$pkgver
  # Use public ASN.1 accessors now that OpenSSL 4 hides the string fields.
  # https://sourceforge.net/p/isync/isync/ci/bdd9ff8d931236e1926a58cb44bd2644e4538217/
  patch -Np1 -i "$srcdir/openssl4.patch"
}

build() {
  cd $pkgname-$pkgver

  env CFLAGS="$CFLAGS -I/usr/include/db5.3/" \
    LDFLAGS="$LDFLAGS -L/usr/lib/db5.3/" \
    ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
