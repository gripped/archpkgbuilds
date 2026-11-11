# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-net-dns-sec
pkgver=1.28
pkgrel=4
pkgdesc="DNSSEC extensions to Net::DNS"
arch=('x86_64')
license=('MIT')
depends=('perl-net-dns' 'perl' 'openssl')
checkdepends=('perl-test-pod')
url='https://metacpan.org/dist/Net-DNS-SEC'
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-SEC-$pkgver.tar.gz")
sha512sums=('0e357c7e000f3d791379d58e388adb3c15d3440d793592624a399115b52d84a71184fa8b4a3850393c1db4e22cfd4df174efd5e165b40ff8b6d2cbf1772d622c')
_distdir="Net-DNS-SEC-$pkgver"

build() {
  cd "$srcdir/$_distdir"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_distdir"
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
