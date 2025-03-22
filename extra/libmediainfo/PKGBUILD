# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=25.03
pkgrel=1
pkgdesc='Shared library for MediaInfo'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD-2-Clause')
depends=(
  'glibc'
  'gcc-libs'
  'curl'
  'glib2'
  'libmms'
  'libzen'
  'tinyxml2'
  'graphviz'
  'zlib'
)
source=("$pkgname-$pkgver.tar.xz::https://mediaarea.net/download/source/libmediainfo/$pkgver/libmediainfo_$pkgver.tar.xz")
sha512sums=('76f6d1ff54c8327ba7e22d794a9064963a76d2fc9aee3346958ea0fe2160c5daa05ea579cdf7667da843fde5936182269c996f4d55d9d4848476c8c8ffa3f8f7')
b2sums=('8b7e67f4e5c2a85c46ab7763e5516eae6ecb85c64b142f47a8baaafc50e102a86c5d876b8680ecfba8a460acb04f2e84241c8b079bf9a9d4045953fa17c68e97')

build() {
  cd MediaInfoLib/Project/GNU/Library

  ./autogen.sh

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-libcurl \
    --with-libmms \
    --with-libtinyxml2 \
    --with-graphviz

  make
}

package() {
  cd MediaInfoLib/Project/GNU/Library

  make DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/MediaInfoLib/LICENSE"
}
