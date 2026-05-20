# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>
# Contributor: François Charette <francois.archlinux.org>

pkgname=perl-xml-libxml
pkgver=2.0211
pkgrel=1
pkgdesc="Interface to the libxml library"
arch=('x86_64')
url="https://search.cpan.org/dist/XML-LibXML"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl-alien-libxml2' 'perl-xml-sax' 'perl-xml-namespacesupport')
checkdepends=('perl-test-pod' 'perl-test-leaktrace' 'perl-cpan-changes' 'perl-uri')
provides=('perl-libxml' 'perl-xml-libxml-common')
replaces=('perl-libxml' 'perl-xml-libxml-common')
options=('!emptydirs')
install=perl-xml-libxml.install
source=(
  https://www.cpan.org/authors/id/T/TO/TODDR/XML-LibXML-$pkgver.tar.gz
)
sha512sums=('5a585a78be6567440ead410fb5a0e2383aab0c6855b6c0312754acfc27a9bae744915e7cdee132ed87ceedf7e18f9dd3ca1251cc80db3a6ee854a2441e74ff82')

build() {
  cd XML-LibXML-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd XML-LibXML-$pkgver
  make test
}

package() {
  cd XML-LibXML-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"/
}
