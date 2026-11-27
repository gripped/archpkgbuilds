# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Robert McCathie <archaur at rmcc dot com dot au>

pkgbase=libwps
pkgname=(libwps libwps-doc)
pkgver=0.4.15
pkgrel=1
pkgdesc="a Microsoft Works file word processor format import filter library"
arch=('x86_64')
url="https://sourceforge.net/projects/libwps/"
license=('LGPL-2.1-or-later OR MPL-2.0')
makedepends=('doxygen' 'librevenge' 'glibc')
source=("https://downloads.sourceforge.net/project/libwps/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha1sums=('e9ab4f6fc66a195170ac9ca9dc33bdece01e376c')
sha256sums=('5b29f1ccd5a0f0737d0f8ff49a1f1c01f5988833c028e7882525136c40674ccc')

build() {
	cd $pkgbase-$pkgver
	./configure  --prefix=/usr \
	  --disable-static
	make
}

check() {
	cd $pkgbase-$pkgver
	make check
}

package_libwps() {
  depends=('librevenge' 'libstdc++' 'libgcc' 'glibc')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install-exec install-pkgconfDATA
  make -C inc/libwps DESTDIR="$pkgdir" install
}

package_libwps-doc() {
  pkgdesc+=" - documentation"

  cd $pkgbase-$pkgver
  make -C docs/doxygen/ DESTDIR="$pkgdir" install
}
