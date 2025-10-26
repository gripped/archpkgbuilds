# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=10.2.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://limine-bootloader.org/"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://codeberg.org/Limine/limine.git#tag=v${pkgver}?signed")
sha256sums=('7d13ada71f23a2ffb5f67aec767fe5ec6acc3e39a418ede02fb3047993074529')
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
