# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# This PKGBUILD was autocreated.  See https://xtermin.us/archperl/ for details
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-user-identity
pkgver=1.03
pkgrel=1
pkgdesc="Perl/CPAN Module User::Identity : Define a person"
arch=("any")
url="https://search.cpan.org/~markov/User-Identity/"
license=("GPL" "PerlArtistic")
source=("https://www.cpan.org/authors/id/M/MA/MARKOV/User-Identity-$pkgver.tar.gz")
sha256sums=('153f2ad0873ad14afe6569e842e441986e6ac160a95644412fe78cefa12a65d4')

build() {
  cd "$srcdir"/User-Identity-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/User-Identity-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
