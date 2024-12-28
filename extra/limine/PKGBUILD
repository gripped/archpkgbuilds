# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=8.6.1
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/limine-bootloader/limine.git#tag=v${pkgver}")
sha256sums=('d8c4156869a166b67027f29d9221aa846e65cf43ad28a90e0d4f9f339707d730')

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
