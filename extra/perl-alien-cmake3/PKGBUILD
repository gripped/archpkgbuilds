# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-alien-cmake3
pkgver=0.09
pkgrel=2
pkgdesc="Find or download or build cmake 3 or better"
arch=('any')
license=('PerlArtistic')
url="https://metacpan.org/release/Alien-cmake3"
depends=('cmake' 'perl-alien-build')
makedepends=('perl-html-parser' 'perl-sort-versions' 'perl-uri' 'perl-io-socket-ssl' 'perl-mozilla-ca')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Alien-cmake3-$pkgver.tar.gz")
sha512sums=('6d0fb388b41fc30291af982fb9725945ddbcd3dd12ce579198b049d8c00f297644e5aed9033553906d44ba0a1d9a3207c6d8fc040ffdc112bec5b990b3463252')

build() {
  cd Alien-cmake3-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Alien-cmake3-$pkgver
  make test
}

package() {
  cd Alien-cmake3-$pkgver
  make DESTDIR="$pkgdir" install
}
