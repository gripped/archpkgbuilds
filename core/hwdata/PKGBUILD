# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdata
pkgver=0.396
pkgrel=1
pkgdesc="hardware identification databases"
makedepends=('git')
replaces=('hwids')
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("git+https://github.com/vcrhonek/hwdata.git#tag=v${pkgver}?signed")
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek
b2sums=('d31941f735c00c8dacad9089dd63509cefb266393849dba9cbf2a6e4c20a814cd3d7a178896be8da45136eb6186d1793ea6635d337a1688199c6a967173093a0')

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
