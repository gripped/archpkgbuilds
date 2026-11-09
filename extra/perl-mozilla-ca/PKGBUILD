# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-mozilla-ca
pkgver=20261105
pkgrel=1
pkgdesc="Mozilla's CA cert bundle in PEM format (using system CA store)"
arch=('any')
license=('MPL-2.0')
options=('!emptydirs')
depends=('perl' 'ca-certificates')
url='https://metacpan.org/release/Mozilla-CA'
source=("https://search.cpan.org/CPAN/authors/id/L/LW/LWP/Mozilla-CA-$pkgver.tar.gz")
sha512sums=('63f6e744b0b7736bd0c055eba48eb6da3885351194a7503ca8e7abbb81f5577dcd739a58d9cf9285f771a72dae83f6c40547d3b6c68ffb88c89f0dde41b94e30')
b2sums=('8dd821b208d7193e0883b6e07100262451a822971eab8cb8079f89e143019eeee1e765898b0c8a9411440ecf2cc806786c7d4bed985b792b03249f22eed79d02')

prepare() {
  cd Mozilla-CA-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt lib/Mozilla/CA/cacert.pem
}

build() {
  cd Mozilla-CA-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Mozilla-CA-$pkgver
  make test
}

package() {
  cd Mozilla-CA-$pkgver
  make install DESTDIR="$pkgdir"

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/perl5/vendor_perl/Mozilla/CA/cacert.pem
}

# vim:set ts=2 sw=2 et:
