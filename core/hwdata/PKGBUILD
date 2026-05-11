# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdata
pkgver=0.407
pkgrel=1
pkgdesc="hardware identification databases"
makedepends=('git')
replaces=('hwids')
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("git+https://github.com/vcrhonek/hwdata.git#tag=v${pkgver}?signed")
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek
b2sums=('a210f54bd939b678a44050b7900b3b0cb73e6527d8479571d6bf9d7df26113ebaa90a689b832ea235d3d9284fea2a752557fa9d464b651c033e704ba95b219fa')

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
