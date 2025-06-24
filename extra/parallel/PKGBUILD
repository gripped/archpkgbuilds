# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20250622
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-only')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('c78ca46c03f03643689a6389d7cb4c4cf3b1a8950d9fd48272b8e6b19c85a3b9c69f38bd4a523e45a37cd9b0ef409468c604cf1bd2925609147ecfeb6a732e56'
            'SKIP'
            'c6ed4e231ca518cd81d4c13374647f6a2e7b4447bda789008b057b285f82a90aa194179bb731c8e5ba961fde400dc3c7cb387efbbe04fa52838c22d2282fa392')
b2sums=('0b433f501e855faa94ac6e917c5f4b0d4c295b9a2671d4d55f286b48b3689ff0f67a5cfc661af42fee90fca477eb53c8355d65d0f6321ee22e83a37bacfa28a3'
        'SKIP'
        '09afa3cc61301415526c8da994d87d7a18c2803b975424c9337e8ee4a7f5a6d1a61424478688e27c404eb1202457d6f3c6cb662dc5deac39f660bdac6527cfc2')
validpgpkeys=('CDA01A4208C4F74506107E7BD1AB451688888888')

prepare() {
  cd "$pkgbase-$pkgver"

  # remove citation warnings
  # https://en.opensuse.org/openSUSE:Packaging_guidelines#Donation_requests
  patch -p1 -i "$srcdir/0001-Remove-citation-things.patch"
}

build() {
  cd "$pkgbase-$pkgver"

  ./configure --prefix=/usr

  make
}

package_parallel() {
  depends=('perl' 'procps')
  optdepends=('parallel-docs: documentation')

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install

  # split documentation out of main package
  mv "$pkgdir/usr/share/doc" docs
}

package_parallel-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase-$pkgver"

  install -vd "$pkgdir/usr/share/doc"
  mv -v docs/* "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
