# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=8.0.9
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/limine-bootloader/limine.git#tag=v${pkgver}")
sha256sums=('b29e9b7f85425cc2cf5df749ef2909b4b4337b2fc62d8be8e26c84ac28b0685f')

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
