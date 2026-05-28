# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.4.1
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for the Linux Kernel exfat driver'
arch=('x86_64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL-2.0-or-later')
depends=('glibc')
provides=('exfat-utils')
conflicts=('exfat-utils')
source=("https://github.com/exfatprogs/exfatprogs/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('241f8bed1091bae8671d59662cdfbd9924a56d4f09cf763e55f6de8503262de2f9f42df06e0b5509dfbf150247f0083beb7c1fad3857b65f7c417cc585928e19')

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
