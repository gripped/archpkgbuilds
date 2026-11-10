# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=luksmeta
pkgver=11
pkgrel=1
pkgdesc='Library for storing metadata in the LUKSv1 header'
arch=('x86_64')
url='https://github.com/latchset/luksmeta'
license=('LGPL-2.1-or-later')
depends=('cryptsetup' 'libcryptsetup.so')
makedepends=('asciidoc')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('74d78fcce442fe078586a58d866861b447dc321db9498f0330d08f0a9d38e93d8d50cad486ae9ec9e8aba74a408f7b6ff066492ba9636021031ccb27615c15d8')

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
	make DESTDIR="$pkgdir" install
}
