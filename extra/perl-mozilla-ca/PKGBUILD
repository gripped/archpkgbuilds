# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-mozilla-ca
pkgver=20250202
pkgrel=1
pkgdesc="Mozilla's CA cert bundle in PEM format (using system CA store)"
arch=('any')
license=('GPL2' 'LGPL2.1')
options=('!emptydirs')
depends=('perl' 'ca-certificates')
url='https://metacpan.org/release/Mozilla-CA'
source=("https://search.cpan.org/CPAN/authors/id/L/LW/LWP/Mozilla-CA-$pkgver.tar.gz")
sha512sums=('ada494e2ecc4a7a780e0b41fddfb3e4ccb2a628411232a7c29a8bd72dbe43173b907946f7621f30c41d7b19c68aa9df55346ca50710867fdef93b4bfcd91e96b')

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
