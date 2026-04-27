# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=perl-xml-parser
pkgver=2.58
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=('x86_64')
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
url="https://github.com/cpan-authors/XML-Parser"
depends=('perl-file-sharedir' 'perl-libwww' 'expat')
makedepends=('git' 'perl-file-sharedir-install' 'perl-devel-checklib')
options=('!emptydirs')
source=("git+https://github.com/cpan-authors/XML-Parser.git#tag=${pkgver}")
sha512sums=('60fccbf6ad870055d9dfa187f0281f7c04a6578712e23d0f1f74ab61ecc2ab33599faadbdfdde1dbabaa8a1800fcc1c4d8b9043fc978845cb1e1a5b4c69570ce')

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
