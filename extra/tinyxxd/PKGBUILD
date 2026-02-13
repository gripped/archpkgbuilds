# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyxxd
pkgver=1.3.11
pkgrel=1
pkgdesc='Standalone version of the hex dump utility that comes with ViM'
arch=(x86_64)
url='https://github.com/xyproto/tinyxxd'
provides=(xxd)
conflicts=(xxd)
license=(GPL-2.0-only MIT)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('35c1a76a89d5db2e3ec8dd49ab6b66f2065b7ce6d2626ee5b474b6cb925fd65c3a919846b0d4b5b41aca67491d4c154354c21021d893faf046a44ac73c8cc45c')

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
