# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-mouse
pkgver=2.5.11
pkgrel=2
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
source=(https://search.cpan.org/CPAN/authors/id/S/SK/SKAJI/Mouse-v$pkgver.tar.gz)
sha512sums=('3c4c09b637711f438bbed7a1de0e074110a5e47573c78e52a545b180733bd892a9d90ec39d538c67a100348638aad1a3a0a7647bdb15e9d88a700aaa2d3ad93d')

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
