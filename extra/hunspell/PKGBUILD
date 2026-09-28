# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=hunspell
pkgver=1.7.4
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library and program"
arch=('x86_64')
url="https://github.com/hunspell/hunspell"
license=('LGPL-2.1-or-later OR GPL-2.0-or-later OR MPL-1.1')
depends=('readline' 'ncurses'  'glibc' 'libstdc++' 'libgcc' 'sh')
optdepends=('perl: for ispellaff2myspell')
source=(https://github.com/hunspell/hunspell/releases/download/v${pkgver}/hunspell-${pkgver}.tar.gz)
sha256sums=('66ec82a577395fe9d471504267e6dd04615c76517c61af7c6b9c19e5e34e73c8')

build() {
  cd hunspell-$pkgver
  ./configure --prefix=/usr \
    --disable-static \
    --with-ui \
    --with-readline
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd hunspell-$pkgver
  make check
}

package() {
  cd hunspell-$pkgver
  make DESTDIR="$pkgdir" install
  
  # add generic hunspell.so for development and projects not using pkgconfig flags - FS#30592
  pushd "$pkgdir"/usr/lib
  ln -s libhunspell-?.?.so libhunspell.so
  popd
}
