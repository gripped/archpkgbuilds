# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=perl-lwp-protocol-https
pkgver=6.15
pkgrel=1
pkgdesc="Provide https support for LWP::UserAgent"
arch=('any')
url="https://metacpan.org/release/LWP-Protocol-https"
license=('PerlArtistic' 'GPL')
depends=('ca-certificates' 'perl-io-socket-ssl' 'perl-net-http' 'perl-libwww')
checkdepends=('perl-test-requiresinternet' 'perl-test-needs')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/LWP-Protocol-https-$pkgver.tar.gz")
sha512sums=('78fbe585dacac943de16f43cfbece13dac90237be4e957713384a69f237236e4aa18584727ec9adba16c459bb9ad74e8ac8acf45b88a74b4e52a5f954e452bb6')

build() {
  cd LWP-Protocol-https-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd LWP-Protocol-https-$pkgver
  make test
}

package() {
  cd LWP-Protocol-https-$pkgver
  make DESTDIR="$pkgdir" install
}
