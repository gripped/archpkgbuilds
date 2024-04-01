# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=24.03
pkgrel=1
pkgdesc='Shared library for MediaInfo'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD')
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
sha512sums=('d1a8b68f5c487a02e82f8363a0364f6d627b79d0ef03f86032d8e6e7f9d0ea77f16325b5148220282edcdded928c634c3c014912adb7901ebf95b87e7c93d26a')
b2sums=('226417ae7b23910bc3fe81a476abebd429d855964582d2f0e25c64a1994fa41df59d036f0ecf7b20bcab71ba3c1da3983acaba215411d2458d00e677f81ffff5')

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
