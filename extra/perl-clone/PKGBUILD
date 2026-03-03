# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: Alex Dioso <adioso->gmail*com>

pkgname=perl-clone
pkgver=0.48
pkgrel=1
pkgdesc='Recursive copy of nested objects.'
arch=('x86_64')
url='https://github.com/garu/Clone'
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-b-cow')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/Clone-$pkgver.tar.gz")
sha512sums=('ea3b5e5f2a48fe2f03231f41dfd8c3acca57d72a31adac3ece297eec0993cbce9f5a15fc6ac3a1a7887e4fa7e0097ffc8cf20ae8d192a62419544b6173a6e608')

build() {
  cd Clone-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Clone-$pkgver
  make test
}

package() {
  cd Clone-$pkgver
  make DESTDIR="$pkgdir" install
}
