# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=Type-Tiny
pkgname=perl-${_pkg,,}
pkgver=2.008003
pkgrel=1
pkgdesc="Tiny, yet Moo(se)-compatible type constraint"
arch=(any)
url="https://metacpan.org/release/${_pkg}"
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-exporter-tiny)
source=(https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/${_pkg}-${pkgver}.tar.gz)
sha512sums=('dcb67373d0fa6d44c6df68207ca5ab67abfe32fb733196468316dea3b806965bfc745a82cba5b31c3033a005eb6e7f6c5c5892f9397b6d970f9e170314430ab9')

build() {
    cd ${_pkg}-${pkgver}
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    perl Makefile.PL
    make
}

check() {
    cd ${_pkg}-${pkgver}
    make test
}

package() {
    cd ${_pkg}-${pkgver}
    make INSTALLDIRS=vendor DESTDIR="${pkgdir}" install
}
