# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.4.0
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for the Linux Kernel exfat driver'
arch=('x86_64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL-2.0-or-later')
depends=('glibc')
provides=('exfat-utils')
conflicts=('exfat-utils')
source=("https://github.com/exfatprogs/exfatprogs/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7a6da25270580e52dcf2107ad9c8572c8833a1a817bc910a3c2ccd66eda189dd9efc6bdf534c9908f76cdb7347fb44ec1178205762b44f958930548c329a9590')

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
