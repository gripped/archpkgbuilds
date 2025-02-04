# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20250122
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-only')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('9f14739e986da5a6a6efcea0b3175a9b9557289f5da774fd8ba264bae497290c8d8d80cd9549e0ec0aaab9ed69b622a6a1cd8b36656fa1adeaee151b7eb95942'
            'SKIP'
            'de3928bf7dca243408ca4c5e60f2caebdf0564edf8821f7e3d0e98df1d25374d3759328e2616f952d6f9759cdbb41862d89c48ebf2d9f49b481922494f1c5812')
b2sums=('b0382927e13bdd3d05a948f85b33f6fd2638bbdbcbaf94031346ad801eec05b5a5b8de4230f846cbc659feeae6b075017c6fad52b75090194c1a08ae855483ad'
        'SKIP'
        'f58dd10c16ca8c53010019c76d7a74b3fb2b49dbd84c3b8ccebaa3e1276769fc3b96341ac0d97b2c8ed6f43171ebdcd471ea28d8aaf660e58ddd54c77085e7d8')
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
