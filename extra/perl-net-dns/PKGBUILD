# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.41
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
sha512sums=('34d41eff48ccee96ee9d7131f1e7c3b98fae25bd870a5e7149d1b5d0e1a6bccb2c26a80a305ed3a4036dfef4b6052101d3d0928f502a960882512e355a7949aa')

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
