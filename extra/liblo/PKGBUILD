# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgbase=liblo
pkgname=(liblo liblo-docs)
pkgver=0.33
pkgrel=1
epoch=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation"
arch=(x86_64)
url="http://liblo.sourceforge.net/"
license=(LGPL-2.1-or-later)
makedepends=(doxygen)
source=(https://github.com/radarsat1/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('5661c737dd2d4b87d47fb3cb87deb08a0e7b9dbb144b459d12a4f1be70f1b1911d250cfa7e158be64d62ff24a670f1e6ab17028e57a73a1ec07a92c0a380826a')
b2sums=('b9feec4d52f0387fe14aa587326da69c6f4cfbf953fb652afe1eddb802958a0e75016228aa67dddaa916a36ad38bf5e4144122a0bea8712b53361fc42574b734')

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
