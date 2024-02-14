# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.43
pkgrel=1
pkgdesc="Perl Module: Interface to the DNS resolver"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/Net-DNS/"
depends=('perl-digest-hmac' 'perl-net-ip')
checkdepends=('perl-test-pod' 'perl-mime-base32' 'perl-net-dns-sec' 'perl-net-libidn2')
optdepends=('perl-io-socket-inet6: IPv6 support'
            'perl-socket6: IPv6 support'
            'perl-net-libidn2: non-ASCII domain support')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-$pkgver.tar.gz")
sha512sums=('a3d60799e08752e2fb90a856a3e56b13ad655a6dbcf13022f544fd292cd3198b2977d01168052b1954c872f1f9e02f529262dd5127ae58a4aca27f740bc284fd')

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
