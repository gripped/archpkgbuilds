# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.46
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
sha512sums=('65cd8422a0e8d3046dbd0f6e0a419b78d5347a96d2975a79d50425509f4dd484183b8e8eaafd3cacc1ba632348a7d77ee0389c4d321417c47c4b84e8f23eb7cd')

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
