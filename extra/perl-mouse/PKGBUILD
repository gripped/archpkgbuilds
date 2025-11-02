# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-mouse
pkgver=2.6.0
pkgrel=1
pkgdesc="Moose minus the antlers"
arch=('x86_64')
url="https://search.cpan.org/dist/Mouse"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-test-exception' 'perl-test-fatal' 'perl-module-build'
             'perl-module-build-xsutil' 'perl-test-requires'
             'perl-test-leaktrace' 'perl-test-output' 'perl-test-deep'
             'perl-io-string')
checkdepends=('perl-path-class')
source=(https://search.cpan.org/CPAN/authors/id/S/SY/SYOHEX/Mouse-v$pkgver.tar.gz)
sha512sums=('aa3e1d915dceaee3ea2d33227fe26db92214bffefd341da9c69007e8cacdceac0c24e39eb258b67edb325416715eb06e39895b615a4154b57af6224cf414f8fa')

build() {
  cd Mouse-v$pkgver
  perl Build.PL --installdirs=vendor
  ./Build
}

check() {
  cd Mouse-v$pkgver
  ./Build test
}

package() {
  cd Mouse-v$pkgver
  ./Build install --destdir="${pkgdir}"
}
