# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-media
pkgver=1.28.2
pkgrel=1
pkgdesc="MATE Media Tools"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-media'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libcanberra
  libgcc
  libmatemixer
  libxml2
  mate-desktop
  pango
)
makedepends=(
  git
  mate-common
  mate-panel
)
optdepends=('mate-panel: Control volume from the panel')
groups=(mate-extra)
source=("git+https://github.com/mate-desktop/mate-media.git#tag=v$pkgver")
b2sums=(071d0900691fe785bdeb91597021fc545b7cc3916e91abf610dcc574564fd002dfdce5d5c5470578b3bed49452109cf79713c562ee8b2b0a34848f96397b9e96)

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-in-process
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
