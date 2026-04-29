# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-ppi
pkgver=1.288
pkgrel=1
pkgdesc="Parse, Analyze and Manipulate Perl (without perl)"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
url="https://metacpan.org/release/PPI"
depends=('perl-clone' 'perl-params-util' 'perl-task-weaken' 'perl-safe-isa' 'perl-yaml-pp')
makedepends=('perl-class-inspector' 'perl-test-nowarnings' 'perl-test-object'
             'perl-test-subcalls')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MITHALDU/PPI-$pkgver.tar.gz")
sha512sums=('1d2d3e3a6f7596d13261f8494de1c35bbc36f99d466012023f4f0cadd2e04853400d5befae024ab1a60e6ccc86abbe7ee977340def57f278eb8220c9f0487247')

build() {
  cd PPI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd PPI-$pkgver
  make test
}

package() {
  cd PPI-$pkgver
  make DESTDIR="$pkgdir" install
}
