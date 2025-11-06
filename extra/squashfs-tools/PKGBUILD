# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: ciccio.a

pkgname=squashfs-tools
pkgver=4.7.3
pkgrel=1
pkgdesc='Tools for squashfs, a highly compressed read-only filesystem for Linux'
arch=(x86_64)
url='https://github.com/plougher/squashfs-tools'
license=(GPL-2.0-or-later)
depends=(
  glibc
  gcc-libs
  lz4
  lzo
  xz
  zlib
  zstd
)
makedepends=(help2man)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('8b334b765d0426acdc3df4d3afc0c197368f81f01a6dd79acf9f894155b60d972bccd198d7652000cf81479084ba45ff2a82611949cc4aa1a71e43317b836ca2')
b2sums=('f514187dee5141f10ae626880dc6d9101b46e480eaa94602307d6e5132fc7dc46d3db24ab041d6f200cdb1f46d325bf89868b708af0891bdb92e6c7ff44d5f92')

build() {
  local make_options=(
    GZIP_SUPPORT=1
    LZ4_SUPPORT=1
    LZMA_XZ_SUPPORT=1
    LZO_SUPPORT=1
    XATTR_SUPPORT=1
    XZ_SUPPORT=1
    ZSTD_SUPPORT=1
    -C $pkgname-$pkgver/$pkgname
  )

  make "${make_options[@]}"
}

package() {
  local make_options=(
    INSTALL_PREFIX="$pkgdir/usr"
    INSTALL_MANPAGES_DIR='$(INSTALL_PREFIX)/share/man/man1'
    install
    -C $pkgname-$pkgver/$pkgname
  )

  make "${make_options[@]}"
  install -vDm 644 $pkgname-$pkgver/Documentation/${pkgver}/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
