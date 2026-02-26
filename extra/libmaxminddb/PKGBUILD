# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: frank AT apsu DOT be

pkgname=(libmaxminddb mmdblookup)

pkgver=1.13.2
pkgrel=1
pkgdesc="MaxMind GeoIP2 database - split package with library and utilities"
license=('Apache-2.0')
arch=('x86_64')
url="https://maxmind.github.io/libmaxminddb/"
optdepends=('geoip2-database: IP geolocation databases')
source=("https://github.com/maxmind/libmaxminddb/releases/download/$pkgver/libmaxminddb-$pkgver.tar.gz")
sha256sums=('2c7aac2f1d97eb8127ae58710731c232648e1f02244c49b36f9b64e5facebf90')

build() {
	cd "$srcdir"/libmaxminddb-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir"/libmaxminddb-$pkgver
	make check
}

package_libmaxminddb() {
	pkgdesc="MaxMindDB GeoIP2 database library"
	depends=('glibc')

	cd "$srcdir"/libmaxminddb-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
	rm -rf "$pkgdir"/usr/{bin,share/man/man1}
}

package_mmdblookup() {
	pkgdesc="MaxMindDB GeoIP2 lookup utility"
	url="https://maxmind.github.io/libmaxminddb/mmdblookup.html"
	depends=('libmaxminddb')

	cd "$srcdir"/libmaxminddb-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
	rm -rf "$pkgdir"/usr/{lib,include,share/man/man3}
}
