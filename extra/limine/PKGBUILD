# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
_pkgname=Limine
pkgver=12.5.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://github.com/Limine-Bootloader/Limine"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
install="${pkgname}.install"
source=("git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('cebcb5f410fc52677276a1186e53e59d20d877b9a72d25da6d2367e214870e55')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821'  # Mintsuki <mintsuki@protonmail.com>
              '6C222EA6B2BD216AA406516AC868F0B6DE38409D') # Kamila Szewczyk <k@iczelia.net>

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
