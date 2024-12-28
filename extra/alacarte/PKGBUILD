# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.54.0
pkgrel=2
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
b2sums=('1884cffaee5cf709a990b50ac161d05d98b1abaf03d4959bfb99b6b67a24ff8d89fd270cdbc1071b53925ca4cde97df437303a229745803f38a6f5602a4ad5a7')
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
