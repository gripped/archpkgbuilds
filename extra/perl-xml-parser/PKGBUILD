# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=perl-xml-parser
pkgver=2.53
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=('x86_64')
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
url="https://github.com/cpan-authors/XML-Parser"
depends=('perl-file-sharedir' 'perl-libwww' 'expat')
makedepends=('git' 'perl-file-sharedir-install' 'perl-devel-checklib')
options=('!emptydirs')
source=("git+https://github.com/cpan-authors/XML-Parser.git#tag=${pkgver}")
sha512sums=('90a378e40b151b019a88fb4598c3407124dfdbdd056b8c2251b6a1588c225be6703fa4ef37e81f46347592dc134d34b798bec57a96444f16192c1541765ba794')

build() {
  cd XML-Parser
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd XML-Parser
  make test
}

package() {
  cd XML-Parser
  make DESTDIR="${pkgdir}" install
}
