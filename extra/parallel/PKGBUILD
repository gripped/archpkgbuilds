# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20251122
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'perl'
  'libreoffice-fresh'
  'graphviz'
  'jdk-openjdk'
  'perl-pod2pdf'
  'perl-pod-pom-view-restructured'
  # pod2texi provided by texinfo in base-devel
)
source=(
  "$pkgname::git+https://git.savannah.gnu.org/git/parallel.git?signed#tag=${pkgver}"
  '0001-Remove-citation-things.patch'
)
sha512sums=('79178dec6a5d1fc4c279fa1152018514afa06ad21b889f743c52c70feb97da9e53d86907890c93a8a40196465e72cb811345ef29ebe999e9451b57d381a53ebb'
            '667f30332c4f0578793ad9a8f13a43f1d840d14855c69e97c83acd4457932bf86bc3a269d73f8e1c27375cb5ff0dfa65dc9bd785ee199d618ef8d4e83c61360e')
b2sums=('b054d77f4300494b9759354f1b6151c4bbb21061bf3c869783db2c755dd5a7a9880d42456629c5c946f98c95ae210a796e2aa158203d5e1c5dac2d1c66d506b8'
        'bfa9086cdb52fae39e39c655a090613cbf2bdaaf719cac34bf2c33db622a2437f82da97c48c3aba0a7ac09cbe3a3015fc575c714c12b5740b53cb74616402390')
validpgpkeys=('CDA01A4208C4F74506107E7BD1AB451688888888')

prepare() {
  cd "$pkgbase"

  # remove citation warnings
  # https://en.opensuse.org/openSUSE:Packaging_guidelines#Donation_requests
  patch -p1 -i "$srcdir/0001-Remove-citation-things.patch"

  autoreconf -fiv
}

build() {
  cd "$pkgbase"

  ./configure --prefix=/usr

  make
}

package_parallel() {
  depends=('perl' 'procps')
  optdepends=('parallel-docs: documentation')

  cd "$pkgbase"

  make DESTDIR="$pkgdir" install

  # split documentation out of main package
  mv "$pkgdir/usr/share/doc" docs
}

package_parallel-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase"

  install -vd "$pkgdir/usr/share/doc"
  mv -v docs/* "$pkgdir/usr/share/doc"
}
# vim:set ts=2 sw=2 et:
