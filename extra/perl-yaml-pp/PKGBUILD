# Maintainer: Ash Berlin-Taylor <ash_archlinux@firemirror.com>
pkgname='perl-yaml-pp'
pkgver=0.40.0
pkgrel=1
_distdir="YAML-PP-v$pkgver"
pkgdesc="Simple configuration automation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=('perl-test-deep>=0' 'perl-test-warn>=0')
url='https://search.cpan.org/dist/YAML-PP'
source=("https://cpan.metacpan.org/authors/id/T/TI/TINITA/YAML-PP-v$pkgver.tar.gz")
sha512sums=('7fdc2f704f9b5feb2600f83dd46098ca52f162da8c01a416859fa74126e3f90c9d063496446f74f4e1dbc322b3ce6eb8ed55b9ea6ddfb10a3b13f16447e21065')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

}
