# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=m4
pkgver=1.4.21
pkgrel=1
pkgdesc="The GNU macro processor"
arch=('x86_64')
url="https://www.gnu.org/software/m4"
license=('GPL-3.0-or-later')
depends=('glibc' 'bash')
source=("https://ftp.gnu.org/gnu/m4/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66'
            'SKIP')
validpgpkeys=('71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')   # Eric Blake

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="${pkgdir}"/usr install
}
