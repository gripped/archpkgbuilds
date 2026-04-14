# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=perl-xml-parser
pkgver=2.55
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=('x86_64')
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
url="https://github.com/cpan-authors/XML-Parser"
depends=('perl-file-sharedir' 'perl-libwww' 'expat')
makedepends=('git' 'perl-file-sharedir-install' 'perl-devel-checklib')
options=('!emptydirs')
source=("git+https://github.com/cpan-authors/XML-Parser.git#tag=${pkgver}")
sha512sums=('ec3f3c536af66ecf4e21e08136ee01aa21197bea6b0c8c8551d0ec48db6f13ec9b9a4da4f3a86d08eb2bbfa7fced27e0aa0fdae2a9a58d6cc4dd86f946c056f3')

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
