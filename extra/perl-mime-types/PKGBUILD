# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
pkgver=2.27
pkgrel=1
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=('any')
url="https://search.cpan.org/dist/MIME-Types/"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-$pkgver.tar.gz")
sha512sums=('e738123bd78b9195bd55d278fdd6b38e0062ef1c03e00ca2de2cd55090de554181bdfdcd12ae22ba22df535971aa63edbb1400c473f3cfac55cbe606fb1d65b9')

build() {
  cd MIME-Types-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MIME-Types-$pkgver
  make test
}

package() {
  cd MIME-Types-$pkgver
  make DESTDIR="${pkgdir}" install
}
