# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=26.01
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
sha512sums=('d9fbed8a5e4b105d836e33152c1c6def9e10c40ade216c189f527bee7853cc90254daa86388a9844f4987fe8c798a55ae109bfbfe9e1610be748bbb16567ef3a'
            'c5d9d5f4cb1a22e1e7fe9d08f6cb1c60fb25a74a653473d9f441a8c936959fdf770b7e9e200683ed884351bd825d3e7de73556186e9b39668285cc93d414b336')
b2sums=('5f9f69673023492e9a5c0cce3feb4aa3235e4e7c09f36d3d49440dc318cb99f6687dc3dd2341e3f3a074edef19ae47c3b368c26430b84c8f3b0cbc80f9e5769e'
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
