# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-net-server
pkgver=2.017
pkgrel=1
pkgdesc='Extensible, general Perl server engine'
arch=(any)
url='https://metacpan.org/release/Net-Server'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(perl)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/B/BB/BBB/Net-Server-$pkgver.tar.gz")
sha512sums=('0fe6b684c76e73a4ac68d25ba073ba9628699dfce507f13c63be2c2ac7965b4db8b55ec6e2c2e06fed52a4f7b065635345ab0f03e43740419ccdc2bb55b29714')
b2sums=('5ad84a89be87b1da7ea0deb483f44d76f766934c33824be05234bbd231240950ab94f6d2a0690764a640c6f10304abeaebf3eef9c0fe7386ab7c791f21bd01cf')

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
