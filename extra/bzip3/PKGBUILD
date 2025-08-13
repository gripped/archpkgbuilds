# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.5.3
pkgrel=1
pkgdesc='A better and stronger spiritual successor to BZip2'
arch=(x86_64)
license=(LGPL3 Apache)
url="https://github.com/kspalaiologos/$pkgname"
depends=(glibc
         sh)
makedepends=(clang)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums=('58a53d002eb80c6f74c292ddf37d4f53604f6e2126cb3ae2bff738971302aa85')

build() {
	cd "$_archive"
	./configure --prefix /usr CC=clang
	make all
}

check() {
	cd "$_archive"
	make check
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" *LICENSE
}
