# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=(parallel parallel-docs)
pkgver=20260222
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=(any)
url='https://www.gnu.org/software/parallel/'
license=(GPL-3.0-or-later)
makedepends=(
  git
  perl
  libreoffice-fresh
  graphviz
  jdk-openjdk
  perl-pod2pdf
  perl-pod-pom-view-restructured
  # pod2texi provided by texinfo in base-devel
)
source=(
  "$pkgname::git+https://git.savannah.gnu.org/git/parallel.git?signed#tag=${pkgver}"
  0001-Remove-citation-things.patch
)
sha512sums=('9625bafca2bf9b1a9629d38b878f74e7c5384989d5d1a2493fcd419a0ff0fe541fd577de2c2e06473c07dd0075f6f003e0a507097321d04e70b2f0edecc9827f'
            '2474044487c71dfffa3529501083b9ed7617db75be52f15565cdde437d8ede1ed06251c360b5fa55fed1a5b27ce2a4430aa8ad6bb3ab3331df7d005cc53f51a4')
b2sums=('3ddaf9dde84ef89179b4edc2c81957fdb726575a2ac23dc5289b674bb06ecb1c68b255b7c5eb570e63af47c14c99aaf0fbd4428f26aa38281c6eaedeac1c33f2'
        '75db3c11920744bd434683a295f228b6359f8b6964b1d1b51f59e48d76bc98bdff8e8529e20f2ddfe53c6f7ac000f9254e7abb20fdcd3f87daa32b94d9562fcf')
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
  depends=(perl procps)
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
