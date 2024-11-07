# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Yue

pkgname=libetonyek
pkgver=0.1.11
pkgrel=1
pkgdesc='Library and a set of tools for reading and converting Apple Keynote presentations'
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libetonyek"
license=('MPL-2.0')
depends=('libxml2' 'zlib' 'librevenge' 'liblangtag' 'gcc-libs' 'glibc')
makedepends=('boost' 'cppunit' 'gperf' 'doxygen' 'glm' 'mdds')
source=(https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('4bbce5aecbfc939e24a2c654efed561930c4605c270476df455fb3118b3ce3ce')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-mdds=2.1
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
