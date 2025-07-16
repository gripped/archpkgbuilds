# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
pkgver=2.03
pkgrel=3
pkgdesc="A simple parallel processing fork manager"
arch=('any')
url="https://metacpan.org/release/Parallel-ForkManager"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-moo')
checkdepends=('perl-test-warn')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/Y/YA/YANICK/Parallel-ForkManager-$pkgver.tar.gz)
sha256sums=('c0e0bead458224b9ac5bb32ed2b1fa088963b565521c1bb1a6a3566d522c2e35')

build() {
  cd Parallel-ForkManager-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Parallel-ForkManager-$pkgver
  make test
}

package() {
  cd Parallel-ForkManager-$pkgver
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
