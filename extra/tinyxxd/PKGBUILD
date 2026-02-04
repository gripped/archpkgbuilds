# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyxxd
pkgver=1.3.10
pkgrel=1
pkgdesc='Standalone version of the hex dump utility that comes with ViM'
arch=(x86_64)
url='https://github.com/xyproto/tinyxxd'
provides=(xxd)
conflicts=(xxd)
license=(GPL-2.0-only MIT)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('7e30ec9b7c7779876a28585140d52f7a54fccd11e6e0f44525e011da798d46d0f21a6b74b5c33bbdfcaa868059e9cfec39845fe036831e9040a271ef05fe9c27')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 AUTHORS.md "$pkgdir/usr/share/licenses/$pkgname/AUTHORS.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/bin/tinyxxd "$pkgdir/usr/bin/xxd"
}
