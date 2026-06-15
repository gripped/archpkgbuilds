# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-moose
pkgver=2.4000
pkgrel=1
pkgdesc="A postmodern object system for Perl 5"
arch=('x86_64')
url="https://metacpan.org/dist/Moose"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=(
  'perl'
  'perl-class-load'
  'perl-class-load-xs'
  'perl-data-optlist'
  'perl-devel-globaldestruction'
  'perl-devel-overloadinfo'
  'perl-devel-stacktrace'
  'perl-dist-checkconflicts'
  'perl-eval-closure'
  'perl-module-runtime'
  'perl-module-runtime-conflicts'
  'perl-mro-compat'
  'perl-package-deprecationmanager'
  'perl-package-stash'
  'perl-package-stash-xs'
  'perl-params-util'
  'perl-sub-exporter'
  'perl-try-tiny'
)
checkdepends=(
  'perl-cpan-meta-check'
  'perl-moo'
  'perl-specio'
  'perl-super'
  'perl-test-deep'
  'perl-test-fatal'
  'perl-test-leaktrace'
  'perl-test-memory-cycle'
  'perl-test-needs'
  'perl-test-output'
  'perl-test-warnings'
  'perl-type-tiny'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Moose-$pkgver.tar.gz")
sha512sums=('facae305a538ce55cad1aa1b420a5a2ba7a6f2de502257fe84094ce1d2f91c8f297318e404c1bc236ce6ef2800bac9bb782191061925505c970fb6e38ff1ab87')

build() {
  cd Moose-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Moose-$pkgver
  make test
}

package() {
  cd Moose-$pkgver
  make DESTDIR="$pkgdir" install
}
