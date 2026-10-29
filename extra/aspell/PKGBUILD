# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aspell
pkgver=0.60.8.3
_pkgmajorver=0.60
pkgrel=1
pkgdesc="A spell checker designed to eventually replace Ispell"
arch=('x86_64')
url="http://aspell.net/"
license=('LGPL-2.0-or-later' 'LGPL-2.1-only' 'GPL-2.0-or-later' 'BSD-2-Clause')
depends=('glibc' 'libstdc++' 'ncurses')
makedepends=('git')
optdepends=('perl: to import old dictionaries')
provides=(libaspell.so libpspell.so)
source=(
  "git+https://github.com/GNUAspell/aspell.git#tag=rel-$pkgver"
)
sha512sums=('014135a111bc9acdeeafc534a36e753a95caf6d401135073bb7d5da7f015fcb09d3ca7a109bbab008ce8693a193502f3109f20a0e762674764e3ae1b8e20d36b')
b2sums=('4d1959748ec8d9409c56a14a6e2d0c001419c95da8e439977c27a4e26db4ff2cff880e7baf48bfdff248a0c1ec992292e6cdd8589c01370cfbaf0db0c4f9f03a')

prepare() {
  cd $pkgname
  PERL_USE_UNSAFE_INC=1 ./autogen
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(libncursesw.so)

  cd $pkgname
  make DESTDIR="$pkgdir" install
  ln -s $pkgname-$_pkgmajorver "$pkgdir"/usr/lib/$pkgname

  install -Dm644 modules/speller/default/affix.license "$pkgdir"/usr/share/licenses/$pkgname/affix.license
}
