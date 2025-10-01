# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=25.09
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
sha512sums=('51ebe4f21c4972746b64a8dfd932ecde742db24c81d0c31d16670e8d4c70634b9616fac3203ea9b4c86bf38f733447c6ad76b8b49c246c9ca6c2dc03df58a49d'
            'c5d9d5f4cb1a22e1e7fe9d08f6cb1c60fb25a74a653473d9f441a8c936959fdf770b7e9e200683ed884351bd825d3e7de73556186e9b39668285cc93d414b336')
b2sums=('f46c340288f1e7709006e10cd5e2a1cfb067401892637fadfc950567d3da7d8e647eb84a5f8f43a669555364c0ff362c54e2ec455ced2a272e69c17e1f3751f2'
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
