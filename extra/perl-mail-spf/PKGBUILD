# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: François Charette <francois.archlinux.org>

pkgname=perl-mail-spf
pkgver=3.20261105
pkgrel=1
pkgdesc="Perl module that provides SPF support"
arch=('any')
license=('BSD-3-Clause')
url="https://search.cpan.org/dist/Mail-SPF/"
depends=('perl-error' 'perl-netaddr-ip' 'perl-uri' 'perl-net-dns' 'perl')
makedepends=('perl-module-build' 'perl-net-dns-resolver-programmable')
conflicts=('perl-mail-spf-query')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MB/MBRADSHAW/Mail-SPF-${pkgver}.tar.gz")
sha256sums=('5f7bc11d3f866d755afae5ecb79ac77b1ec0be2a4a2357175be2a9135dcfe6fd')

build() {
  cd Mail-SPF-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Mail-SPF-${pkgver}
  make test
}

package() {
  cd Mail-SPF-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
