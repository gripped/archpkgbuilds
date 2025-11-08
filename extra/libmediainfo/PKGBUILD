# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=25.10
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
source=("$pkgname-$pkgver.tar.xz::https://mediaarea.net/download/source/libmediainfo/$pkgver/libmediainfo_$pkgver.tar.xz"
         graphviz-13.patch)
sha512sums=('05db22b40492cc6acfa717146eeb1fe766ec5f70e287ea886c5e1b99ef01956e08f75690e2454ab6413850ac69d7143a7aa48010f03c45d8a460caeacdc10cba'
            'c5d9d5f4cb1a22e1e7fe9d08f6cb1c60fb25a74a653473d9f441a8c936959fdf770b7e9e200683ed884351bd825d3e7de73556186e9b39668285cc93d414b336')
b2sums=('bcfa4cbf29e0900a05d46db1af7ecdb96e66202ed5970e9be7eb0c62fbcd2c5effb45dd107e510e4a48ebf43dc770d8c2acc82dc0b3c077c09bde4f7fafeb314'
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
