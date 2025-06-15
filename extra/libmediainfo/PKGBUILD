# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=25.04
pkgrel=2
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
source=("$pkgname-$pkgver.tar.xz::https://mediaarea.net/download/source/libmediainfo/$pkgver/libmediainfo_$pkgver.tar.xz"
         graphviz-13.patch)
sha512sums=('2dc1cfc7317c0d08505499ba775d69312a0b83d4a3b4200eb50ca258018a2fa4d12aab2a9c487df42eda92ad2cb221156d90ffbe60e3e47c0382e7a80c514ea0'
            '5befcbb17b473f4c28810895bb1555493a21093a7653ac848cd20524393733b48ac259fcbac663c091dae4f6736f17df5d48d6ea3eb154f63d155fe897e9ab3c')
b2sums=('fe0d2a13030da0fc36c6a91d2f534e69b2c41e1ce0c9f9d03c06df903f00274276e5e3d783396e475fd80bf7222337bb1b598a6076a11c7b70c79815769cd7ef'
        '179d52d1bc6850ffb7cfc696b0a82f5a09c66e857d538dee6f72379b80dca4149b948407e6cdf01705de13aedcad3ffbddfc447cf99ec9985ea1a65d38623c5c')

prepare() {
  patch -d MediaInfoLib -p1 < graphviz-13.patch # Fix build with GraphViz 13
}

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
