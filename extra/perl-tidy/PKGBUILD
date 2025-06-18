# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>

pkgname=perl-tidy
pkgver=20250616
pkgrel=1
pkgdesc="Parses and beautifies perl source"
arch=('any')
url="https://search.cpan.org/dist/Perl-Tidy"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/S/SH/SHANCOCK/Perl-Tidy-$pkgver.tar.gz)
sha256sums=('b07517e3f6198d24a4890665338847d79008f7dcc68461811905c7e62a1e689a')

build() {
  cd  "${srcdir}"/Perl-Tidy-$pkgver

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "${srcdir}"/Perl-Tidy-$pkgver

  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
