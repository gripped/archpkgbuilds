# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20250422
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-only')
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
  "git+https://git.savannah.gnu.org/git/parallel.git?signed#tag=${pkgver}"
  '0001-Remove-citation-things.patch'
)
sha512sums=('d6e693f45df24c3fc758a20adbd70de8960e39b76698be033f771b956d7c1183c04b0e0f971208c64e8ebc9d0528baf208663d90a60b51b6ceb104ad97c9525b'
            'e6cad1946433fb0a8858e5b43f23370ff627fce12b1a1d7d0a66113ee362ca0d69f484be607392cfe7491d71cd8d5113c50caf1d4158370a751c17db1ad7f0bb')
b2sums=('88ff073b3cdaf2e27ab5564d6f7c4729b69507a3ccf81a9b614c4e231b182f613771fe12d41ebecbb3023da1c245a48ff93226db8991470bedeaeb251486c258'
        '1ea9405c5e35d47572993fe50316bb558008c7dac97c65b6b6e9b2e5d299d21ca090cd5e497c5f3001a515dbbfcdbde16867927ac15397cfc9c25565b690d411')
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
