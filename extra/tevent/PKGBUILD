# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Marco A Rojas <marquicus at gmail dot com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Thomas Burdick <thomas.burdick@gmail.com>

pkgname=tevent
pkgver=0.17.0
pkgrel=1
epoch=1
pkgdesc='Event system based on the talloc memory management library'
url="https://tevent.samba.org/"
arch=('x86_64')
source=(https://samba.org/ftp/tevent/${pkgname}-${pkgver}.tar{.gz,.asc})
license=('GPL-3.0-or-later')
depends=('talloc')
makedepends=('python' 'cmocka')
optdepends=('python: for python bindings')
provides=(libtevent.so)
validpgpkeys=('9147A339719518EE9011BCB54793916113084025') # Samba Library Distribution Key <samba-bugs@samba.org>
b2sums=('352a00bc1d90880eac54c1fc91e52edcb1c92514ce684d10ea642f6a73d7f827fc8794e5dbd06641f03143445fda34e0d4bc1f0ccf98109d50c5d335d35cdb56'
        'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bundled-libraries=NONE \
    --builtin-libraries=replace
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
