# CPAN Name  : Log::Report
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-report
pkgver=1.45
pkgrel=1
pkgdesc='Perl package to log/report a problem with exceptions, pluggable handlers and translation support'
arch=('any')
url='https://metacpan.org/release/Log-Report'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-log-report-optional' 'perl-string-print' 'perl-devel-globaldestruction')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-$pkgver.tar.gz)
sha256sums=('bf08ea5ea171944fdaeb33ef7bd85d2bb3f9065553eb867637eb9f60cc19fa1f')

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
