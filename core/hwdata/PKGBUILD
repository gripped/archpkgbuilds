# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdata
pkgver=0.410
pkgrel=1
pkgdesc="hardware identification databases"
makedepends=('git')
replaces=('hwids')
url=https://github.com/vcrhonek/hwdata
license=('GPL-2.0-or-later')
arch=('any')
source=("git+https://github.com/vcrhonek/hwdata.git#tag=v${pkgver}?signed")
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek
b2sums=('4bcb79e5acbd559fc2c1376367b31b54e5b8c56130f6831e049ad57f22989b690b5329622367a762895890c9f98d0976ecf7b4df5a3291b855cc1b97a9003cce')

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
