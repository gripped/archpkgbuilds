# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Marco Cilloni <krnlpk@gmail.com>

pkgname=exfatprogs
pkgver=1.4.5
pkgrel=1
pkgdesc='exFAT filesystem userspace utilities for the Linux Kernel exfat driver'
arch=('x86_64')
url='https://github.com/exfatprogs/exfatprogs'
license=('GPL-2.0-or-later')
depends=('glibc')
provides=('exfat-utils')
conflicts=('exfat-utils')
source=("https://github.com/exfatprogs/exfatprogs/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('8a2515800ffa5181421ffb44fb082d8a4098b4386e2c0ada6d6af9ef30069f9e87f3ffc732a036a5175cc55611ac3698f5cffa8316face19d82fb21a1ca8ccd6')

prepare() {
  cd exfatprogs-${pkgver}
  ./autogen.sh
}

build() {
  cd exfatprogs-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname}
  make
}

package() {
  cd exfatprogs-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}"/usr/share/man/man8 */*.8
}
