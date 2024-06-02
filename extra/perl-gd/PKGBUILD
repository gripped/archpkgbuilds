# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+aur@gmail.com>

pkgname=perl-gd
pkgver=2.82
pkgrel=1
pkgdesc="Interface to Gd Graphics Library"
arch=('x86_64')
url="https://search.cpan.org/dist/GD"
license=('GPL' 'PerlArtistic')
depends=('perl' 'gd')
makedepends=('perl-extutils-pkgconfig')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/R/RU/RURBAN/GD-$pkgver.tar.gz)
sha512sums=('4aca1de74855e79d35cdffa167bba7f50cfc017ee855953bcda1d896d1e9da5976eae8fe3ab6ac2c682597b4a8424f100afc4a67aee2cdc6f88a19ff261551e8')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='"$pkgdir"'" \
    PERL_MB_OPT="--installdirs vendor --destdir '"$pkgdir"'" \
    MODULEBUILDRC=/dev/null

  cd  "$srcdir"/GD-$pkgver
  perl Makefile.PL
  make
}

package() {
  cd  "$srcdir"/GD-$pkgver
  make install
}
