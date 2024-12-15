# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.48
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
sha512sums=('386cb9774ccb31359a65deb45b818d37f0dd55c397034f302171d181147ca90fb994ee38d841c5930e7dfd4e0f7157c6aa6ced0257aa334253cb3b9ee4b34187')

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
