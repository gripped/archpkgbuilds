# CPAN Name  : Log::Report
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-report
pkgver=1.44
pkgrel=1
pkgdesc='Perl package to log/report a problem with exceptions, pluggable handlers and translation support'
arch=('any')
url='https://metacpan.org/release/Log-Report'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-log-report-optional' 'perl-string-print' 'perl-devel-globaldestruction')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-$pkgver.tar.gz)
sha256sums=('f747e6575fc68f5811b655ee51674593ff9e90f6016142f2764a8cd3f0ef4fc9')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Log-Report-$pkgver
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-$pkgver
	sanitize
	make test
}

package() {
	cd Log-Report-$pkgver
	sanitize
	make install DESTDIR="$pkgdir"
}
