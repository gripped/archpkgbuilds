# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Andre Klitzing <aklitzing () online () de>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi> aka Neverth

pkgname=po4a
pkgver=0.72
pkgrel=1
pkgdesc="Tools for helping translation of documentation"
arch=('any')
url="https://po4a.org/"
license=('GPL')
depends=('perl' 'gettext' 'perl-yaml-tiny' 'perl-unicode-linebreak')
makedepends=('perl-text-wrapi18n' 'perl-locale-gettext' 'perl-term-readkey'
             'perl-sgmls' 'perl-module-build' 'perl-pod-parser' 'docbook-xsl')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/mquinson/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('17fbd720099e067a5877037420dce11f10a4efcd1a174eae5d17cf615ac1d21c')

build() {
  cd ${pkgname}-${pkgver}
  perl Build.PL installdirs=vendor create_packlist=0
  # The script expects a UTF-8 locale
  LC_ALL=en_US.UTF-8 perl Build
}

package() {
  cd ${pkgname}-${pkgver}
  perl Build destdir="${pkgdir}" install
  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
