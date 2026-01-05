# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-mouse
pkgver=2.6.1
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
source=(https://search.cpan.org/CPAN/authors/id/S/SK/SKAJI/Mouse-v$pkgver.tar.gz)
sha512sums=('d7f365331a0eaab83483091612802bb3973bd097442cc07fd74cd69eeb40e7c4e849a71f906890cff17df4918487842ff2fb778d62296205cd313a26a895919c')

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
