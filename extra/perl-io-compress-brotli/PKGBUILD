# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-io-compress-brotli
epoch=1
pkgver=0.007
pkgrel=1
pkgdesc='Read/write Brotli buffers/streams'
url="https://metacpan.org/release/IO-Compress-Brotli"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'brotli' 'perl-file-slurper')
source=("https://search.cpan.org/CPAN/authors/id/T/TI/TIMLEGGE/IO-Compress-Brotli-$pkgver.tar.gz"
        use-system-brotli.patch)
sha512sums=('f3fd67dc2dcb0187e5092aa17f11323d04ed933bf90f4717ff10efd1f7377961778498310be42de6e424b901c4d1bbd8742766d6778f30738458826057b0e718'
            '0809243c6030b12b652c044deadb5c1c7e9a88033d8f45e66d5651c9289cbfcb94e80560777508986949ea2bd77d4ef1e2826871ea4b90864fd2cc58d5733991')

prepare() {
  cd IO-Compress-Brotli-$pkgver
  patch -p0 -i ../use-system-brotli.patch
}

build() {
  cd IO-Compress-Brotli-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd IO-Compress-Brotli-$pkgver
  make test
}

package() {
  cd IO-Compress-Brotli-$pkgver
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
