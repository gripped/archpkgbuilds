# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Yue

pkgbase=libetonyek
pkgname=(libetonyek libetonyek-doc)
pkgver=0.1.15
pkgrel=1
pkgdesc='Library and a set of tools for reading and converting Apple Keynote presentations'
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libetonyek"
license=('MPL-2.0')
makedepends=(
  'boost' 'cppunit' 'doxygen' 'glibc' 'glm' 'gperf' 'liblangtag'
  'librevenge' 'libxml2' 'mdds' 'zlib'
)
source=(https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('ba81a37e1be25dcaf73035c4a3cc4787a1e053b3272b2383ed3dec899c6a884f')

prepare() {
  cd $pkgbase-$pkgver
  autoreconf -vfi
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --with-mdds=3.0
  make
}

check() {
  cd $pkgbase-$pkgver
  make check
}

package_libetonyek() {
  depends=('libxml2' 'zlib' 'librevenge' 'liblangtag' 'libstdc++' 'libgcc' 'glibc')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install-exec install-pkgconfDATA
  make -C inc/libetonyek DESTDIR="$pkgdir" install
}

package_libetonyek-doc() {
  pkgdesc+=" - documentation"

  cd $pkgbase-$pkgver
  make -C docs/doxygen/ DESTDIR="$pkgdir" install
}
