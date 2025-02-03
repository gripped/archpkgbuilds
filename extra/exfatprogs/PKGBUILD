# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.2.7
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for the Linux Kernel exfat driver'
arch=('x86_64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('exfat-utils')
source=("https://github.com/exfatprogs/exfatprogs/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('e020155d16009db0d6493fbdc9b0b492ca94e6f9298e2e724be84da75e26dfa0c8f558d6a91edb94f53f4edabf0ba45b22277c02455dc6aff1106c686c013215')

prepare() {
  cd exfatprogs-${pkgver}
  ./autogen.sh
}

build() {
  cd exfatprogs-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd exfatprogs-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}"/usr/share/man/man8 */*.8
}
