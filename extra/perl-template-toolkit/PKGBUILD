# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom Killian <tomk@runbox.com>
# Contributor: FJ <joostef@gmail.com>

pkgname=perl-template-toolkit
pkgver=3.103
pkgrel=1
pkgdesc="Perl template processing system"
arch=('x86_64')
url="https://metacpan.org/release/Template-Toolkit"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl-appconfig' 'perl')
checkdepends=('perl-cgi' 'perl-image-info' 'perl-test-leaktrace')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/T/TO/TODDR/Template-Toolkit-$pkgver.tar.gz)
sha512sums=('50413fbe962a0063f24a7118e397471b2c0a73add9677921d924573e3746279c8d7f078b1a7d96af24d507b99682d4d84d0b27c047d34b93c0f901fde6c2c98c')

build() {
  cd Template-Toolkit-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor TT_ACCEPT=y
  make
}

check() {
  cd Template-Toolkit-$pkgver
  make test
}

package() {
  cd Template-Toolkit-$pkgver
  make install DESTDIR="${pkgdir}"
}
