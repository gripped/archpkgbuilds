# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime
pkgver=1.66
pkgrel=2
pkgdesc="A complete, easy to use date and time object"
arch=('x86_64')
url="https://search.cpan.org/dist/DateTime"
license=('GPL' 'PerlArtistic')
depends=('perl-datetime-timezone>=0.59' 'perl-datetime-locale>=0.41'
	 'perl-params-validate>=0.76' 'perl-math-round'
	 'perl-namespace-autoclean' 'perl-specio' 'perl-eval-closure'
	 'perl-params-validationcompiler')
makedepends=('perl-module-build')
LC_NUMERIC=C
provides=("perl-datetime=`printf %.4f $pkgver`")
options=('!emptydirs')
source=(https://www.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-$pkgver.tar.gz)
sha512sums=('18e371dad068b1e13415bf00274e4a3f421e6afc53eca9dbe07f63b27e8b71a8f0466fa3fa9f91c3d4b66a6f6c8cb0541f15f9534148fe57dbb813283c58ebdb')

build() {
  cd  "$srcdir"/DateTime-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

# TODO: FIXME: FS#58776
_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')

package() {
  cd  "$srcdir"/DateTime-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
