# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Maarten de Vries <maarten@de-vri.es>

_pkg=filter-dkimsign
pkgname=opensmtpd-${_pkg}
pkgver=0.6
pkgrel=4
pkgdesc="OpenSMTPD filter for signing mail with DKIM"
license=(BSD)
url="https://imperialat.at/dev/filter-dkimsign/"
arch=(x86_64)
depends=(libopensmtpd openssl)
makedepends=(gzip mandoc)
source=(https://src.imperialat.at/releases/${_pkg}-${pkgver}.tar.gz)
sha512sums=('723b86f7acbe55d1a1e12f630c562e9c621adb34c5eb3ee7709fd18cef03b916b5035cc338f4b641c26cc1fc56f1e14cf02e47734e4fb22a08fcf23b3dcdde1e')

build() {
  cd ${_pkg}-${pkgver}
  make -f Makefile.gnu HAVE_ED25519=1
}

package() {
  cd ${_pkg}-${pkgver}
  make -f Makefile.gnu BINDIR=/usr/lib/smtpd/opensmtpd/ DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
