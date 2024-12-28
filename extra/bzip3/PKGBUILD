# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.5.1
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
sha256sums=('53b844f9d9fb1d75faa4d3a9d9026017caaf50bb200b320d1685c6506b8f3b37')

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
