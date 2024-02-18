# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=libdwarf
epoch=1
pkgver=0.9.1
pkgrel=1
pkgdesc="A library for handling DWARF Debugging Information Format"
arch=(x86_64)
license=('GPL' 'LGPL')
url="https://www.prevanders.net/dwarf.html"
depends=('elfutils')
checkdepends=('python')
provides=('libdwarf.so')
options+=('staticlibs' 'debug')
#_commit="245262d6ccaeed17f7564c31b78da2d4df1a3ee0"
#source=(https://sourceforge.net/code-snapshots/git/l/li/libdwarf/code.git/libdwarf-code-$_commit.zip)
source=(https://www.prevanders.net/libdwarf-$pkgver.tar.xz)
sha512sums=('ec66f0dbc72df3dd689a2d38ebae029e081e0ec3008dd510372e0c2c387f0092c2f9fe8d9928ded87b9c2ec30f1c3dc63bfaca7cc4a14e1c8c557d3c3b37d227')

build() {
  cd "$srcdir"/libdwarf-$pkgver
  # cd "$srcdir"/libdwarf-code-$_commit
  CFLAGS+=" -ffat-lto-objects"
  ./configure --prefix=/usr --includedir=/usr/include/libdwarf --enable-shared
  make
}

check() {
  cd "$srcdir"/libdwarf-$pkgver
  # cd "$srcdir"/libdwarf-code-$_commit
  make -j1 check
}

package() {
  cd "$srcdir"/libdwarf-$pkgver
  # cd "$srcdir"/libdwarf-code-$_commit
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/usr/share/doc/$pkgname
  install -m644 README NEWS "$pkgdir"/usr/share/doc/$pkgname/
}
