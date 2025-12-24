# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=(parallel parallel-docs)
pkgver=20251222
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
sha512sums=('80921cd5c27b98f8cae0e63bc668a2a5ef8fcb0e65a8045c45d70c8fdb90b7bce6a8378cbed6587709fb2782b83013a5615464e8d055b851e557b5b379708eea'
            'd80f1906e8635528784a618c3804d425e7c19810aed339d4c355a6e58a35e62e1c3a1ccd997a347c2c6a3d5a46a4a709514e55c1ad13b32da10136a4faa3901f')
b2sums=('6c6f658325ed35987d210ab62a49a9e8108e98bee04efe77ba32a4b99b2b0f9b4b39254228263d9e332de915978a2b3f3c3190b7101f991c732a104ba127f72a'
        'fd41fabb689cfa89dcda3aacc153b29654b60f7b540200a10b7fffc839f86dd27a3692d576a621f6a71653d3d3bba814e9dcf54cb278b7efd670b9481f5e7d6a')
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
