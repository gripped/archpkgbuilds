# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=25.04
pkgrel=3
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
            'c5d9d5f4cb1a22e1e7fe9d08f6cb1c60fb25a74a653473d9f441a8c936959fdf770b7e9e200683ed884351bd825d3e7de73556186e9b39668285cc93d414b336')
b2sums=('fe0d2a13030da0fc36c6a91d2f534e69b2c41e1ce0c9f9d03c06df903f00274276e5e3d783396e475fd80bf7222337bb1b598a6076a11c7b70c79815769cd7ef'
        'a26d3207609bf16f66ef12ee54104af0b8660288abb2f9be6c73eb314fa347fd9f38cb15215ce23dbc63fe0a2525437f330a4bee2efd5b702ee7dbdb5b3b8660')

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
