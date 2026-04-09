# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-io-tty
pkgver=1.27
pkgrel=1
pkgdesc="Provide an interface to TTYs and PTYs"
arch=('x86_64')
url="https://search.cpan.org/dist/IO-Tty/"
license=("GPL-1.0-or-later" "Artistic-1.0-Perl")
depends=('glibc')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TODDR/IO-Tty-$pkgver.tar.gz")
sha256sums=('83459d10a2768df598b58e2ae5946e6c259456cb4eccf85f8652d0c7d8991f2c')

build() {
  cd "$srcdir"/IO-Tty-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd "$srcdir"/IO-Tty-$pkgver
  make install DESTDIR="$pkgdir"
}
