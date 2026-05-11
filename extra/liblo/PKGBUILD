# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgbase=liblo
pkgname=(liblo liblo-docs)
pkgver=0.35
pkgrel=1
epoch=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation"
arch=(x86_64)
url="http://liblo.sourceforge.net/"
license=(LGPL-2.1-or-later)
makedepends=(doxygen)
source=(https://github.com/radarsat1/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('c9a1247213533f8d52a7ec71be884aa7595ace2575ed805dc35b2cc5fd93bed899d2a339291f142f440a6dea0747966cf847037b86b3981e44f6dd0c28dbba79')
b2sums=('f79c76ab527c18721232d506191842a3d5728302047bb091aacbf1033f7c874b6cc574b148c0e9a5847edff6fd553e337b9f300549a13399824cf6abf1f1d2a0')

prepare() {
  cd $pkgname-$pkgver
  # fixing bug in autotools setup:
  # https://github.com/radarsat1/liblo/issues/96
  ln -svf README.md README
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package_liblo() {
  depends=(glibc)
  optdepends=(
    'liblo-docs: for documentation and examples'
  )
  provides=(liblo.so)

  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/doc/man/man3/*.3 -t "$pkgdir/usr/share/man/man3"
}

package_liblo-docs() {
  pkgdesc+=" - documentation"

  install -vDm 644 $pkgbase-$pkgver/examples/*.{cpp,c} -t "$pkgdir/usr/share/$pkgbase/examples/"
  install -vDm 644 $pkgbase-$pkgver/doc/html/* -t "$pkgdir/usr/share/doc/$pkgbase/html/"
  install -vDm 644 $pkgbase-$pkgver/doc/latex/* -t "$pkgdir/usr/share/doc/$pkgbase/latex/"
  install -vDm 644 $pkgbase-$pkgver/{AUTHORS,ChangeLog,NEWS,README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgbase/"
}
# vim:set ts=2 sw=2 et:
