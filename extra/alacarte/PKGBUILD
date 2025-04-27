# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.56.0
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
b2sums=('cdd719b68aadb7f656567dd86a4c10770b1b9f6e4243fc1a5711e0305328cccceaec1105ffff77b676a5fab45e989da832b07c1a2bfeccf22c18f7bbcdcc431a')
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
