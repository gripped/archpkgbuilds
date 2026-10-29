# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
_pkgname=Limine
pkgver=12.9.6
pkgrel=1
pkgdesc="Modern, secure, portable, multiprotocol bootloader and boot manager"
url="https://github.com/Limine-Bootloader/Limine"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
# The edk2-ovmf-stable-bins release the test suite boots
_ovmfbins=20261026T212116Z
checkdepends=('python' 'qemu-system-x86' 'qemu-system-aarch64' 'qemu-system-riscv' 'qemu-system-loongarch64' 'swtpm' 'libisoburn' 'openssl')
install="${pkgname}.install"
source=("git+${url}.git#tag=v${pkgver}?signed"
        "edk2-ovmf-bins-${_ovmfbins}.tar.xz::https://github.com/osdev0/edk2-ovmf-stable-bins/releases/download/${_ovmfbins}/edk2-ovmf-bins.tar.xz")
sha256sums=('60ebfefbe492a7a0077eef53ae52cfb4c0156a06aa20750d87c21d48250f2389'
            '1619a6884c9380516152c2fe3c73fe1d7851014f3ec6a784b5d7b0324983b4d4')
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

check() {
	cd "${_pkgname}"
	# Boot the pinned firmware rather than have make check download the latest
	ln -sfn "${srcdir}/edk2-ovmf-bins" edk2-ovmf-bins
	make check
}

package() {
	cd "${_pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
