# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=8.0.3
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/limine-bootloader/limine.git#tag=v${pkgver}")
sha256sums=('79199086abb7a9f6482c04eb4f505043dacb12be24a36e36d597dbd7e761b685')

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
