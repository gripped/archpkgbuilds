# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# This PKGBUILD was autocreated.  See https://xtermin.us/archperl/ for details
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-user-identity
pkgver=3.00
pkgrel=1
pkgdesc="Perl/CPAN Module User::Identity : Define a person"
arch=("any")
url="https://search.cpan.org/~markov/User-Identity/"
license=("GPL" "PerlArtistic")
source=("https://www.cpan.org/authors/id/M/MA/MARKOV/User-Identity-$pkgver.tar.gz")
sha256sums=('105f8e2b44ea9ca3ddd373a5aeea945045ce8f7743b4e798b41011c2250e97af')

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
