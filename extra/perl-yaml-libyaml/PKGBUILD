# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-yaml-libyaml'
pkgver=0.907.0
pkgrel=1
pkgdesc="Perl YAML Serialization using XS and libyaml"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-warnings')
url='https://search.cpan.org/dist/YAML-LibYAML/'
source=("https://cpan.metacpan.org/authors/id/T/TI/TINITA/YAML-LibYAML-v$pkgver.tar.gz")
sha256sums=('6ba087224911389e76fa198b149cec83f065b0ac75ddc52618f3490942cd9506')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='"$pkgdir"'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '"$pkgdir"'" \
      MODULEBUILDRC=/dev/null
    cd "$srcdir/YAML-LibYAML-v$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/YAML-LibYAML-v$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/YAML-LibYAML-v$pkgver"
  make install
}
