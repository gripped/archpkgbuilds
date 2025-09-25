# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jan@archlinux.org>

pkgname=gnome-menus
pkgver=3.36.0
pkgrel=4
pkgdesc="GNOME menu specifications"
url="https://gitlab.gnome.org/GNOME/gnome-menus"
arch=(x86_64)
license=(GPL LGPL)
groups=(gnome)
depends=(glib2)
makedepends=(gobject-introspection git)
provides=(libgnome-menu-3.so)
_commit=66ac7579856968d3f4b76c04d55327c60b37f2fb  # tags/3.36.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-menus.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix introspection data for GLib 2.86
  # https://gitlab.gnome.org/GNOME/gnome-menus/-/merge_requests/16
  git cherry-pick -n fe1eca74e1b6d75941d56088ea2aeca97b639926

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package(){
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
