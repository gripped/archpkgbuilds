# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Jason Hall <cakersq@gmail.com>

pkgname=thin-provisioning-tools
pkgver=1.0.8
pkgrel=1
pkgdesc='Suite of tools for manipulating the metadata of the dm-thin device-mapper target'
arch=('x86_64')
url='https://github.com/jthornber/thin-provisioning-tools'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jthornber/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1afa8cf5c8b30c2c2e7bf45ca2af2c94b524ca63ef049322aa0dea6abe7e36fa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make \
    DESTDIR="${pkgdir}"/usr \
    BINDIR="${pkgdir}"/usr/bin \
    DATADIR="${pkgdir}"/usr/share \
    install
}

