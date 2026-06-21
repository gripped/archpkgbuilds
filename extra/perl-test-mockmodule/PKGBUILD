# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-test-mockmodule
pkgver=0.185.0
pkgrel=1
pkgdesc="Override subroutines in a module for unit testing"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-super')
makedepends=('perl-module-build')
checkdepends=('perl-class-load' 'perl-moose' 'perl-mouse' 'perl-test-exception' 'perl-test-pod'
              'perl-test-pod-coverage' 'perl-test-warnings')
url='https://search.cpan.org/dist/Test-MockModule'
source=("https://search.cpan.org/CPAN/authors/id/G/GF/GFRANKS/Test-MockModule-v$pkgver.tar.gz")
sha512sums=('8f8eaa1fd815f7831ad9a39c845cb65c1e02acc3be8bd0be3b4973693fa8fd0c2be577a2e679d647d567b40c81cb45ee017d7149a6dbdc5d3faea0fc54045a56')

build() {
  cd "$srcdir/Test-MockModule-v$pkgver"
  perl Build.PL installdirs=vendor
  perl Build
}

check() {
  cd "$srcdir/Test-MockModule-v$pkgver"
  perl Build test
}

package() {
  cd "$srcdir/Test-MockModule-v$pkgver"
  perl Build install destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
