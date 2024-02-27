# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-applets
pkgver=3.50.0
pkgrel=3
pkgdesc='Small applications for the GNOME Panel'
arch=('x86_64')
url='https://wiki.gnome.org/Projects/GnomeApplets'
license=('GPL-2.0-or-later')
depends=('at-spi2-core' 'cairo' 'cpupower' 'dconf' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-panel'
         'gsettings-desktop-schemas' 'gtk3' 'hicolor-icon-theme' 'libgtop' 'libgweather-4'
         'libnotify' 'libwnck3' 'libx11' 'libxml2' 'pango' 'polkit' 'tracker3' 'upower')
makedepends=('itstool')
optdepends=('tracker3-miners: Search bar')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz"
        'gnome-applets-git-fixes.patch'
        'gnome-applets-98.patch'
        'gnome-applets-103.patch')
sha256sums=('6f791a831f1643e62f389eec08b1ea3df1f3afed43ab34096fa21cfa78dc80a5'
            '64ab2d9b0a10f68a3806d74bac73bd6c5c6361bfa0a4d3cffc0ef98887bb0ebb'
            'a0ea3eeeda6c09e156c7713b45998de7674bcd4c720d1bb98c9ce97703bcf4db'
            'dbe5249780318e021f074f5dca12017183a8e797d37f093a4ed025c32a8310db')

prepare() {
  cd $pkgname-$pkgver

  # Apply fixes from git master
  patch -Np1 -i ../gnome-applets-git-fixes.patch

  # Destroy preferences window on dispose
  # https://gitlab.gnome.org/GNOME/gnome-applets/-/merge_requests/98
  patch -Np1 -i ../gnome-applets-98.patch

  # Use standard icon names
  # https://gitlab.gnome.org/GNOME/gnome-applets/-/merge_requests/103
  patch -Np1 -i ../gnome-applets-103.patch

  # Regenerate resources file
  rm gnome-applets/ga-resources.{c,h}
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
