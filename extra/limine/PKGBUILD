# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
_pkgname=Limine
pkgver=12.1.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://github.com/Limine-Bootloader/Limine"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
install="${pkgname}.install"
source=("git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('e2dd587ae0d00b56324a3fba2a0b42036206ae5359604c221bb849f6a1439572')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

prepare() {
	cd "${_pkgname}"
	./bootstrap
}

build() {
	cd "${_pkgname}"
	./configure --prefix=/usr --enable-all
	make
}

package() {
	cd "${_pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
