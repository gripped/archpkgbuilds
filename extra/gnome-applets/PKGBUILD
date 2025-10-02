# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-applets
pkgver=3.58.0
pkgrel=1
pkgdesc='Small applications for the GNOME Panel'
arch=(x86_64)
url='https://wiki.gnome.org/Projects/GnomeApplets'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  cpupower
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gnome-panel
  gsettings-desktop-schemas
  gtk3
  hicolor-icon-theme
  libgtop
  libgweather-4
  libnotify
  libwnck3
  libx11
  libxml2
  pango
  polkit
  tinysparql
  upower
)
makedepends=(
  autoconf-archive
  git
  glib2-devel
  yelp-tools
)
optdepends=('localsearch: Search bar')
source=(
  "git+https://gitlab.gnome.org/GNOME/$pkgname.git?signed#tag=$pkgver"
  gnome-applets-98.patch
)
b2sums=(
  feba46e84504d10e9dbfddad6545b05dfce8a477f5bf38d584c4d2bb032661adbd36f67ab0c82d278cc5f0550fdde7b5d7be75020238af5c7ebf7642d1022b6f
  d33772454e20dbfcb884e9ccbb4ad8705366c6a0313f94fef3791c90daa4d5daf50b39333b2af89992c37d34fdca99cb42384d479dd07438095ec2f67a214fe1
)
validpgpkeys=(7B44FD78E49334EC10B3B288A3D013EC303E1894) # Alberts Muktupāvels <alberts.muktupavels@gmail.com>

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/gnome-applets/-/merge_requests/98
  git apply -3 ../gnome-applets-98.patch

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --enable-compile-warnings
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
