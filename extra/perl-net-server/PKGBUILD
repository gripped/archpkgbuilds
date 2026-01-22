# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-net-server
pkgver=2.015
pkgrel=1
pkgdesc='Extensible, general Perl server engine'
arch=(any)
url='https://metacpan.org/release/Net-Server'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(perl)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/B/BB/BBB/Net-Server-$pkgver.tar.gz")
sha512sums=('f90000db9b92dbe3ccdcd4d7f1322204daad1ddb1e5839a371bb49e4eba6dba9e6d613fa58d02907681b764ab2534220b2fa5f7cfa36e49e8959a1b078f64778')
b2sums=('08181dfe6160e547bbdb9858e3cce69027238effba3290fd0e4eb62d53f37478533401b8b0f44648617a861384e13403ec5ae465ccd0a8f50d23a03fd650949a')

build() {
  cd Net-Server-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Net-Server-$pkgver
  make test
}

package() {
  cd Net-Server-$pkgver
  make install DESTDIR="$pkgdir"
}
