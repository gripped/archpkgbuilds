# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-mozilla-ca
pkgver=20240924
pkgrel=1
pkgdesc="Mozilla's CA cert bundle in PEM format (using system CA store)"
arch=('any')
license=('GPL2' 'LGPL2.1')
options=('!emptydirs')
depends=('perl' 'ca-certificates')
url='https://metacpan.org/release/Mozilla-CA'
source=("https://search.cpan.org/CPAN/authors/id/L/LW/LWP/Mozilla-CA-$pkgver.tar.gz")
sha512sums=('5886ec35ce9bdc63684b519fc6a434c061a70d785cc6c9087e46cc5b1518ff71e91e07a41798ad8a67d9c55217640dd69047317f91d860f0930187986621b1d9')

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
