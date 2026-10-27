# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-panel
pkgver=1.28.7
pkgrel=3
pkgdesc="The MATE Panel"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-panel'
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=(
  at-spi2-core
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk-layer-shell
  gtk3
  hicolor-icon-theme
  libgcc
  libice
  libmateweather
  libsm
  libwnck3
  libx11
  libxrandr
  mate-desktop
  mate-menus
  pango
  wayland
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  mate-common
  yelp-tools
)
groups=(mate)
source=(
  "git+https://github.com/mate-desktop/mate-panel.git#tag=v$pkgver"
  git+https://github.com/mate-desktop/mate-submodules.git
  mate-panel-fix-in-process.patch
  mate-panel-clear-icon.patch
  mate-panel-calendar-popup-position.patch
  mate-panel-no-weather-info.patch
)
b2sums=(
  9a92b0f76cfc0b48f517944863a932694b42bf0e8373e55de873115ad72ebd20c36527e6c56c9ec5ad28ad7a1f1a4968a15af00ace6adca14c132fa1bedaf83c
  SKIP
  76f65b2ea92fff59e38dfe268991d6885a1af4f7eefe1d3ddd291682cab4cbfb74512fb4a06dcc22d1f169db7f29d2e4362fa718e7f4f8a409582a36975fde27
  12ef614dbfa73f10fb8bb6798146a0e483538f439c74ebb4be76983c3e6011026e46e2d2e629356cc5f83c202e8c8a0c9d25b113fd30afa06bd7f4c6245b30d3
  c6d2a31b4d2082a24650444b076a97cebed32b408d7935bc7fa2f8ced308d400cde5c57546b2dbf067d365d90527694d6c41e9af98f3b608c3c20e3bacc2dc47
  c0a42a9360d626aa8ac704ae04f348547b40ded47909a797f1f9614fae1bbcde7bede3d0b7d48d2ecb3dc60b81bbff7ec30a8aa8e6d4fe79644c488d971e8a97
)

prepare() {
  cd $pkgname

  git submodule init
  git config submodule.mate-panel/mate-submodules.url "$srcdir/mate-submodules"
  git -c protocol.file.allow=always submodule update

  # Don't use gtk_show_about_dialog
  # https://github.com/mate-desktop/mate-panel/pull/1590
  git apply -3 ../mate-panel-fix-in-process.patch

  # Use 'edit-clear-all' icon for Clear Recent Documents
  # https://github.com/mate-desktop/mate-panel/pull/1591
  git apply -3 ../mate-panel-clear-icon.patch

  # clock: Fix calendar popup positioning
  # https://github.com/mate-desktop/mate-panel/pull/1592
  git apply -3 ../mate-panel-calendar-popup-position.patch

  # clock: Hide weather conditions if no weather info
  # https://github.com/mate-desktop/mate-panel/pull/1593
  git apply -3 ../mate-panel-no-weather-info.patch

  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --with-in-process-applets=all
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
