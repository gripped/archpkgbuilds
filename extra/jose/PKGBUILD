# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=jose
pkgver=14
pkgrel=1
pkgdesc='C-language implementation of Javascript Object Signing and Encryption'
arch=('x86_64')
url='https://github.com/latchset/jose'
license=('Apache-2.0')
depends=('jansson' 'openssl' 'zlib')
makedepends=('git' 'asciidoc' 'meson')
source=("git+$url#tag=v$pkgver")
sha512sums=('06bd926befe2cc35924cb3b5946751538a52f5fc8f6cf7ff9cf6ba36f4cc2d77875ab26add6b52ca0baa945247eb3a3419052ec78a013fbded971c66ce0244b8')
b2sums=('85bdf7df62978131ab1bf5048692e7c80992068e287a1f08eb813204b1e13cf45dc624e58636d97af7fc0171f5c2a709c4fe82a0a42ee116201240158cda01c4')

build() {
	cd "$pkgname"
	meson --prefix=/usr --buildtype=plain build
	meson compile -C build
}

check() {
	cd "$pkgname"
	meson test -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" meson install -C build
}
