# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-$_pkgbasename
epoch=1
pkgver=4.1.0
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('Apache-2.0')
depends=('lib32-brotli' 'lib32-glibc' 'lib32-zlib' 'lib32-zstd' "${_pkgbasename}")
makedepends=('perl')
optdepends=('ca-certificates')
provides=('libcrypto.so' 'libssl.so')
source=("https://github.com/${_pkgbasename}/${_pkgbasename}/releases/download/${_pkgbasename}-${pkgver}/${_pkgbasename}-${pkgver}.tar.gz"{,.asc})
sha256sums=('50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd'
            'SKIP')
validpgpkeys=('B146647E45A7B33947AB226B2A2C87D161692D40')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "$srcdir"/$_pkgbasename-$pkgver

	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared enable-ktls enable-brotli enable-zlib enable-zstd linux-elf

	make depend
	make
}

check() {
	cd "$srcdir"/$_pkgbasename-$pkgver
	make HARNESS_JOBS=$(nproc) test
}

package() {
	cd "$srcdir"/$_pkgbasename-$pkgver
	make DESTDIR="$pkgdir" install_sw

	rm -r "$pkgdir"/usr/{include,bin}
}
