# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=(parallel parallel-docs)
pkgver=20260422
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
sha512sums=('7f7ce3ac1921695f982c7f3314d913e66fb85ede1fd7e823e1ff7083a84825e5bc288b8b3cec606ccbd8cb0967542dad2f20ad5b18bd66a636762ad96c7ecf9e'
            '6c2383bbfb039a2d643286c7994573605842abcba9a79e6cefed7e2fe8de452ab258047cec7ad1feff9239b8afb245c8645dca738cd1a6108a96d3ed06c97175')
b2sums=('5cca04f7cfe429d5c545123ee9e554eb4b643a5bdd250160b1056fffe2172af658ec940b7d6312081ddcd607a76f60d35d3aae220f1dc084db7b87489ea36571'
        '1d131760052d6b47e101dcc6642faa26c9864c1040615f6b88407819eb43342bd81049bd65c6ef6835a14fd15cd9474db84f0154c1ad8f5739d55f40feda07ee')
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
