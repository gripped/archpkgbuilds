# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.58
pkgrel=1
pkgdesc="Perl Module: Interface to the DNS resolver"
arch=('any')
license=('MIT')
url="https://search.cpan.org/dist/Net-DNS/"
depends=('perl-digest-hmac')
checkdepends=('perl-test-pod' 'perl-net-libidn2')
optdepends=('perl-net-libidn2: non-ASCII domain support')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-$pkgver.tar.gz")
sha512sums=('2e3242e2125c042851fc6812fe5428af1faeda8255b3a3bcbc4432dc282d96527d765563291cd6ebb9949fcb6bd3dca7e4d1e0e925a95519d8416f4985207806')

build() {
  cd Net-DNS-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Net-DNS-$pkgver
  make test
}

package() {
  cd Net-DNS-$pkgver
  make DESTDIR="$pkgdir" install
}
