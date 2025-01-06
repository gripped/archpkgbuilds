# Maintainer: Sébastien Luttringer

pkgname=perl-test-output
pkgver=1.035
pkgrel=1
pkgdesc='Utilities to test STDOUT and STDERR messages'
arch=('any')
license=('GPL' 'PerlArtistic')
depends=('perl-sub-exporter'
  'perl-test-simple'
  'perl-test-pod'
  'perl-test-pod-coverage'
  'perl-capture-tiny')
url='https://search.cpan.org/dist/Test-Output'
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/B/BR/BRIANDFOY/Test-Output-$pkgver.tar.gz")
sha512sums=('dcd251d0ba26663b36dc23d52e0e36fa039e97655bcb489ccf61c3dd7fad6b5ed4a38a35db45b02193b541c1b4b1149d8f19eceac3ddfe0784dc87fb33727188')

build() {
  cd Test-Output-$pkgver
  USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Test-Output-$pkgver
  make test
}

package() {
  cd Test-Output-$pkgver
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
