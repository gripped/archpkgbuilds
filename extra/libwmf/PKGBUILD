# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libwmf
pkgver=0.2.14
pkgrel=1
pkgdesc="A library for reading vector images in Microsoft's native Windows Metafile Format (WMF)"
arch=('x86_64')
url="https://github.com/caolanm/libwmf"
license=('LGPL-2.1-or-later')
depends=('expat' 'freetype2' 'glibc' 'libjpeg-turbo' 'libpng' 'libx11' 'zlib')
makedepends=('gdk-pixbuf2' 'git')
optdepends=('gdk-pixbuf2: for pixbuf loader')
source=("git+https://github.com/caolanm/libwmf.git#tag=v$pkgver")
sha256sums=('f3efa1f98c953d69e2f58872ab3a92faf1b3da90fe0bec241383516112b85a48')

prepare() {
  cd ${pkgname}
  autoreconf -fi
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr \
              --with-gsfontmap=/usr/share/ghostscript/Resource/Init/Fontmap.GS \
              --with-gsfontdir=/usr/share/fonts/gsfonts
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
