# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-mozilla-ca
pkgver=20240730
pkgrel=2
pkgdesc="Mozilla's CA cert bundle in PEM format (using system CA store)"
arch=('any')
license=('GPL2' 'LGPL2.1')
options=('!emptydirs')
depends=('perl' 'ca-certificates')
url='https://metacpan.org/release/Mozilla-CA'
source=("https://search.cpan.org/CPAN/authors/id/L/LW/LWP/Mozilla-CA-$pkgver.tar.gz")
sha512sums=('f1d0d1760148f0f5ecf5f7329182aaa1c977f1ab8466795b548877cab9c72a2a4f2c96a82fb91548b45022a2da75bb6ce32375e1085acf671f9731b6b2eae7fe')

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
