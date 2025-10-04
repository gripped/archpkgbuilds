# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=stalonetray
pkgver=0.9.0
pkgrel=2
pkgdesc="STAnd-aLONE sysTRAY. It has minimal build and run-time dependencies: the Xlib only."
arch=('x86_64')
url="https://github.com/d3adb5/stalonetray"
license=('GPL')
depends=('libx11' 'libxpm' 'libxinerama')
makedepends=('libxslt' 'docbook-xsl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/d3adb5/stalonetray/archive/$pkgver.tar.gz")
sha512sums=('d88afe5655390fd13f045c542c578a0e02ea2111f6b523962ec334f00948c270e3a381e7f8b943a091c9862f9714e6a46063f30eb9eb943b13baa606a5d17066')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  test -x configure || aclocal && autoheader && autoconf && automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 stalonetrayrc.sample.in "$pkgdir"/etc/stalonetrayrc # FIXME
}
