# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20250922
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
sha512sums=('c4538c4f3188a022bb38f74f42aa98c98f2d08ad22f9fd9ad7c1c46a4031dd4eea67203a1ce5ab40c5edefc693e7222554961455db832822dd7851a135029558'
            'b859f0a4fc07ba65d2d4badccb18de58eacc7023a514acb9fb1a140d98dc2c73e46da6fa45d8d27b8db26065373afef26a63099df79b117c7987ed5156401f77')
b2sums=('d091e210f3a7640962bc7e57fc2dbb9e4d8c5c09f85429cb216f91903bb33dc8b311249c4f879d99c015f6cf993551f2fc851fc16f1a35940a0d2ba1af146683'
        '39c3c9139d14b0fc01a8f33b746a541927f32e2902c6c43f959ceea578a38dd4776a13fcd3f142516f2080633ff30fcd6ffcdc2dcd7e9cbec6318849937e17db')
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
