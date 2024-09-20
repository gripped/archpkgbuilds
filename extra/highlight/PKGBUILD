# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Jan Fader <jan.fader@web.de>
pkgbase=highlight
pkgname=(highlight highlight-gui)
pkgver=4.14
pkgrel=1
url="http://www.andre-simon.de/doku/highlight/highlight.html"
license=('GPL')
arch=('x86_64')
makedepends=(qt5-base lua boost)
source=(http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2{,.asc})
md5sums=('82f788661e4c6aa5467d90b8add68c9f'
         'SKIP')
sha256sums=('099e0eaf38709fe430108125ad9d35f7aacfa05d5d41ad20f405593b575627c5'
            'SKIP')
validpgpkeys=(B8C55574187F49180EDC763750FE0279D805A7C7)

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"

  sed -i 's/QMAKE=qmake/QMAKE=qmake-qt5/' src/makefile
  sed -i 's/QMAKE_CC = clang/QMAKE_CC = gcc/' src/gui-qt/highlight.pro
  sed -i 's/QMAKE_CXX = clang++/QMAKE_CXX = g++/' src/gui-qt/highlight.pro
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  make QMAKE=qmake-qt5
  make QMAKE=qmake-qt5 gui
}

package_highlight() {
  pkgdesc="Fast and flexible source code highlighter (CLI version)"
  depends=('lua')
  backup=(etc/highlight/filetypes.conf)
  cd "$srcdir/$pkgbase-$pkgver"

  make DESTDIR="$pkgdir" QMAKE=qmake-qt5 install
}

package_highlight-gui() {
  pkgdesc="Fast and flexible source code highlighter (Qt version)"
  depends=('qt5-base' 'highlight')
  cd "$srcdir/$pkgbase-$pkgver"

  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" QMAKE=qmake-qt5 install-gui
}

# vim:set ts=2 sw=2 et:
