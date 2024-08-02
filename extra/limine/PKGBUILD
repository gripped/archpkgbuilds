# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
pkgver=8.0.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/limine-bootloader/limine.git#tag=v${pkgver}")
sha256sums=('faae033dffe507f93af98f2b2e603b64fdee0a483cb255bc75617a8b285e67e8')

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
