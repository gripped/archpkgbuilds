# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20231022
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL3')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('6b311217d1c75f4ef276c560db3c1fbd5491ed283c9033cc3363e2cc7a8fa12765afda5869b8e203b9a75a6660b8d959cad4e741efa4cf07c1736104d8645f23'
            'SKIP'
            'b6ae08cbb9bd2b7e294bed540e75f33042f008842aad96c5725187bf0914822e79de450346864d05ce479776240ef82ee74ae3a8dceb856d7276a2fc69359f9e')
b2sums=('96c3bb8812c6929cc6fcf4d3629f5b8a2d8c7a0160495133272c7c848d43d0123f2e067e4207d23243c688acd40ffa3522b3db39d06eb798702598d828aa11cb'
        'SKIP'
        '18294a69bec4692c763d98a7ba56424040cd3f582c579b6d7aef339586d8d385df32ea8c28e1690ad59a582e129f5d98329fb58eba13de28182fbf0be5cfeae7')
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
