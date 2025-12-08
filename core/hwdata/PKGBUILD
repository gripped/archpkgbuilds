# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdata
pkgver=0.402
pkgrel=1
pkgdesc="hardware identification databases"
makedepends=('git')
replaces=('hwids')
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("git+https://github.com/vcrhonek/hwdata.git#tag=v${pkgver}?signed")
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek
b2sums=('99ac92348556c8f6b735558c7957e7ab965b2cff94686891c541fdfdc1d2cec22121e4a81bd3d8ccd972f354519a13c727cc5e3a0934dcb9864307ea278b753a')

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
