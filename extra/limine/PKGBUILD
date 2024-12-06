# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=8.6.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/limine-bootloader/limine.git#tag=v${pkgver}")
sha256sums=('7f12d11438e8bc2e7d7df902dee2b54d8438965a2618417cf3edff57fdfc4aa5')

prepare() {
	cd "${pkgname}"
	./bootstrap
}

build() {
	cd "${pkgname}"
	./configure --prefix=/usr --enable-all TOOLCHAIN_FOR_TARGET=llvm
	make
}

package() {
	cd "${pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
