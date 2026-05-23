# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>
# Contributor: François Charette <francois.archlinux.org>

pkgname=perl-xml-libxml
pkgver=2.0212
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
sha512sums=('91d6438742b0f907c3b0c69bf2348adf7a18df38d2452e7b9eb426b4855af1f99ca9098ba71b9824d29c391ba9b49981f2553da635f0a8795adc309cc54fd1b2')

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
