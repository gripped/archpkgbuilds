# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=perl-text-bibtex
_dist=Text-BibTeX
pkgver=1.00
pkgrel=2
pkgdesc='Perl interface to read and parse BibTeX files'
arch=(x86_64)
url="https://metacpan.org/dist/${_dist}"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('glibc' 'perl>=5.26.0')
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-capture-tiny>=0.06')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/A/AM/AMBS/${_dist}-${pkgver}.tar.gz)
sha512sums=('ba026452eaa2acebe3a963674e687035984acc3777f91f89f830fefb59bf8df53dac78fa8a01f2ae281a7e7bd36e187d8a52b62b812006b4365ee82eb5642472')
b2sums=('a2b090f76851cbdb0edf47c26560e628d18477ba83891acad6f5b7a4e0281f37e09fec68391bf025b907e22d4c9c929d13ada548c3789ce005b08963807881c4')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    perl Build.PL
    ./Build
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_LOCAL_LIB_ROOT
    ./Build test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_LOCAL_LIB_ROOT
    ./Build install installdirs=vendor destdir="$pkgdir"
}
