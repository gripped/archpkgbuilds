# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.54.1
pkgrel=1
epoch=1
pkgdesc="Menu editor for gnome"
url="https://gitlab.gnome.org/GNOME/alacarte"
arch=(any)
license=(LGPL-2.0-or-later)
depends=(
  gdk-pixbuf2
  glib2
  gnome-menus
  gtk3
  hicolor-icon-theme
  python
  python-cairo
  python-gobject
)
makedepends=(
  docbook-xsl
  git
  libxslt
)
source=("git+https://gitlab.gnome.org/GNOME/alacarte.git?signed#tag=$pkgver")
b2sums=('e1475bff2245e5a8a3d34075379909b40b65bcb9b38281b5521440b0b86bd541dd5aa66686d8b54fa4f882db9f57a34b73114d39093c6d265026c8d00ea923ea')
validpgpkeys=(
  7B44FD78E49334EC10B3B288A3D013EC303E1894 # Alberts Muktupāvels <alberts.muktupavels@gmail.com>
)

prepare() {
  cd alacarte
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
  )

  cd alacarte
  ./configure "${configure_options[@]}"
  make
}

package() {
  make -C alacarte DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}

# vim:set sw=2 sts=-1 et:
