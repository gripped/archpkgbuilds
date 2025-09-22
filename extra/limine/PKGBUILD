# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=10.0.1
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://limine-bootloader.org/"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://codeberg.org/Limine/limine.git#tag=v${pkgver}?signed")
sha256sums=('c3e6837e206e612c6fec5436254abae1d4b25eec003ca075e68717a3fd30eeb6')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

prepare() {
	cd "${pkgname}"
	./bootstrap
}

build() {
	cd "${pkgname}"
	./configure --prefix=/usr --enable-all
	make
}

package() {
	cd "${pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
