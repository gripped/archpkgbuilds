# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=flex
pkgver=2.7.9
pkgrel=1
pkgdesc="A tool for generating text-scanning programs"
arch=('x86_64')
url="https://github.com/westes/flex"
license=('custom:flex')
depends=('glibc' 'm4' 'sh')
makedepends=('help2man')
checkdepends=('git')
source=("https://github.com/westes/flex/releases/download/v$pkgver/flex-$pkgver.tar.gz"{,.sig})
sha256sums=('eda7d158abe845c49956554488a0749a637891124824a77ab16dadbe0ce58eb7'
            'SKIP')
validpgpkeys=('56D664C70CC2364CF5164914B7DFE8BB6C241FED'  # Flex Releases
              '56C67868E93390AA1039AD1CE4B29C8D64885307') # Will Estes

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	# prevent excessive overlinking due to libtool
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
}

check() {
	make -k check -C $pkgname-$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	ln -s flex "${pkgdir}/usr/bin/lex"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
