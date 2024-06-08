# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20240522
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-only')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('22156c2ba722696e8f85efcc5996e6811523c2545d8a3daf328801f09b1edb9665172ddce2cf738d1c6af87ac9da0268ec1e4b07178f81c4bea27f3903d78bfd'
            'SKIP'
            '71c46d2c08179fe28b55312998643000d3394f6002ab3ff8b851694af9960aabdc86c4d13a6d143f9b83a5a95f7f97fbfef0bab8008cd88fb6b07e91bd9d4ec9')
b2sums=('50a6b41959ac06d92dc7f10492a7c758504bfb2686d2cfb8c6092f8e6a272abaaa6e40d209b48e8dcfef42460fdffd31d7e0d789591b347bcaa5ca22a5ac58a9'
        'SKIP'
        '5debd2c3f2cee47de92d931f2a4c0ef91db70777e6b1d0ed4fb4c4bfe627a503e5e90a9fb6018b53acabcc7e7973d1faecebec9104be4b9c13bfe926c747d3f3')
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
