# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>

pkgname=stress-ng
pkgver=0.22.00
pkgrel=1
pkgdesc="Software to stress test a computer system in various selectable ways"
url="https://github.com/ColinIanKing/stress-ng"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('acl' 'apparmor' 'gmp' 'judy' 'kmod' 'libbsd' 'libjpeg-turbo' 'lksctp-tools' 'mpfr' 'xxhash')
optdepends=('intel-ipsec-mb: support for IPsec tests'
	    'linux-headers: include some headers from the Arch kernel'
	    'linux-lts-headers: include some headers from the LTS kernel'
	    'linux-zen-headers: include some headers from the ZEN kernel'
	    'linux-hardened-headers: include some headers from the HARDENED kernel')
makedepends=('attr' 'eigen' 'keyutils' 'libaio' 'libcap' 'libgcrypt' 'libmd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz")
b2sums=('496d5a1cc7052a0408ac183a395003857c57b45797cda8294f043e458f1bb99ba0917fee9011d9348f4b4625eb1037dfda5094de4b39bd7c4ec9b38cfdcb0b31')

prepare() {
	cd "${pkgname}-${pkgver}"
	make clean
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
