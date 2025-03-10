# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: François Charette <francois.archlinux.org>

pkgname=perl-mail-spf
pkgver=3.20240923
pkgrel=1
pkgdesc="Perl module that provides SPF support"
arch=('any')
license=('custom')
url="https://search.cpan.org/dist/Mail-SPF/"
depends=('perl-error' 'perl-netaddr-ip' 'perl-uri' 'perl-net-dns' 'perl')
makedepends=('perl-module-build' 'perl-net-dns-resolver-programmable')
conflicts=('perl-mail-spf-query')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/M/MB/MBRADSHAW/Mail-SPF-${pkgver}.tar.gz")
sha256sums=('dd348caaf4947ec5013f79cc66ae99b92b38b8723619efbe36760e12cb221430')

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
