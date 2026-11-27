# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=libepubgen
pkgver=0.1.2
pkgrel=1
pkgdesc="an EPUB generator for librevenge"
arch=('x86_64')
url="https://sourceforge.net/projects/libepubgen/"
license=('MPL-2.0')
depends=('librevenge' 'glibc' 'libstdc++' 'libgcc')
makedepends=('boost' 'cppunit' 'doxygen' 'libxml2')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha1sums=('e491cb6b32ad39a1d388ec87cca099ebd5e19203')
sha256sums=('196c4bf9380463a3b40eb82c7dbf8a8b6a954987b4abbefe55467c215996eb7e')



prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

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
	make DESTDIR="$pkgdir/" install
}
