# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=perl-xml-parser
pkgver=2.54
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=('x86_64')
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
url="https://github.com/cpan-authors/XML-Parser"
depends=('perl-file-sharedir' 'perl-libwww' 'expat')
makedepends=('git' 'perl-file-sharedir-install' 'perl-devel-checklib')
options=('!emptydirs')
source=("git+https://github.com/cpan-authors/XML-Parser.git#tag=${pkgver}")
sha512sums=('5e8ed9156c1be72f8004e6f15da73263271f3d3817542e2cfd5d96e5a318cab09edabcf2848173b4c1fc3b5ea6ebe43ad94b6628f159a4c39eb7228a6a4f69ba')

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
