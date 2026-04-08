# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor: Bjorn Martensen

pkgname=libisofs
pkgver=1.5.8.1
pkgrel=1
pkgdesc='Library to pack up hard disk files and directories into a ISO 9660 disk image'
arch=(x86_64)
url='https://dev.lovelyhq.com/libburnia/libisofs'
license=(GPL-2.0-or-later)
depends=(glibc acl zlib)
makedepends=(git)
source=("$pkgname::git+$url#tag=release-${pkgver//.1/.pl01}")
sha512sums=('6e2444113ddba94647251019dbb297963572b0ee91ec5546372b6eea43ad46290fd763cd65050746334469b09d6992c2c5a60f1f539282b1709ea34740ce580a')
b2sums=('9a15228e685f229a584187e34e0c06a348817ace60297d0e69d8932e3219702553097aa3a190e3d21fec3091907db0f8ef69010e7c0ad9d4582483e78c4b9ebe')

prepare() {
  cd "$pkgname"

  autoreconf -vfi
}

build() {
  cd "$pkgname"

  ./configure \
    --prefix=/usr \
    --enable-libacl \
    --enable-xattr \
    --disable-static

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
