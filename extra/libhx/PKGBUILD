# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=libhx
_srcname=libHX
pkgver=5.5
pkgrel=1
pkgdesc='A library providing queue, tree, I/O and utility functions'
arch=(x86_64)
url="https://inai.de/projects/${pkgname}/"
license=(GPL-3.0-only LGPL-2.1-or-later)
depends=(glibc)
provides=(libHX.so)
source=(https://inai.de/files/${pkgname}/${_srcname}-${pkgver}.tar.{zst,asc})
sha256sums=('822e51adde09238b29f907ddcd0157b1c0eb34d104ecc1e7ac8f3bccc4fd9a42'
            'SKIP')
validpgpkeys=('2BDA563E9DDE46AF71CC171DAEB6941A2F9C9944')

prepare() {
	cd "${_srcname}-${pkgver}/"
	autoreconf -vi
}

build() {
	cd "${_srcname}-${pkgver}/"
	./configure --prefix=/usr
	make
}

check() {
	make -C "${_srcname}-${pkgver}" check
}

package() {
	DESTDIR="${pkgdir}" make -C "${_srcname}-${pkgver}" install
}
