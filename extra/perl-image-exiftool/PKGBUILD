# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Firmicus <francois.archlinux.org>

pkgname=perl-image-exiftool
pkgver=13.15
pkgrel=1
pkgdesc="Reader and rewriter of EXIF information that supports raw files"
arch=('any')
url="https://exiftool.org/"
license=('GPL')
makedepends=('git')
depends=('perl')
optdepends=('perl-archive-zip: Support for zip files, including epub'
            'perl-io-compress-brotli: Support for brotli-compressed metadata')
provides=("perl-exiftool=${pkgver}")
replaces=("perl-exiftool")
options=('!emptydirs')
source=("git+https://github.com/exiftool/exiftool.git#tag=${pkgver}")
sha256sums=('769d5443ac4318cc363b3a0592787ccbb981b2c9ab18c25baa3dd98c182c00fa')

build() {
  cd exiftool
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd exiftool
  make test
}

package() {
  cd exiftool
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r fmt_files config_files arg_files "${pkgdir}/usr/share/${pkgname}"
}
