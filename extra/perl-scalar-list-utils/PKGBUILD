# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-scalar-list-utils'
pkgver=1.66
pkgrel=1
pkgdesc="A selection of general-utility list subroutines"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Scalar-List-Utils'
source=("https://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-List-Utils-$pkgver.tar.gz")
sha256sums=('9bf113e682b43fa93c8803e43e96afce5f81ea4027912d0d9acdc9b591b05370')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='"$pkgdir"'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '"$pkgdir"'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/Scalar-List-Utils-$pkgver"
    perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/Scalar-List-Utils-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/Scalar-List-Utils-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
