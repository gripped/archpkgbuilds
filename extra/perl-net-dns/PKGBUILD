# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-net-dns
pkgver=1.55
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
sha512sums=('ec48f4c3ea675822a59faa280763571ff2f0c3b4997a558eca15de9856ebf4753e249a8d8243ad91372386afdcc00a4a1330d6700febb8a75933452553299db1')

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
