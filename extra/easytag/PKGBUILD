# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=easytag
pkgver=2.4.3
pkgrel=12
pkgdesc='Simple application for viewing and editing tags in audio files'
arch=(x86_64)
url='https://wiki.gnome.org/Apps/EasyTAG'
license=(GPL-2.0-or-later)
depends=(
  dconf
  flac
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  id3lib
  libid3tag
  libogg
  libvorbis
  opus
  opusfile
  speex
  taglib
  wavpack
)
makedepends=(
  appstream-glib
  git
  glib2-devel
  intltool
  yelp-tools
)
source=(
  "git+https://gitlab.gnome.org/GNOME/$pkgname.git?signed#tag=$pkgname-$pkgver"
  easytag-dark-theme.patch
  easytag-taglib-2.patch
  easytag-scrolled-window.patch
  easytag-playlist-dialog.patch
)
b2sums=(
  bc0e51a4d2eca339b122a5f2c65625f0a3d7364a370f4d61a7b22dae8b84a3732fd382c9800eb464562edf352116f149414230ecea670146250bbeccb8c31f66
  3b7bbddc5ee496917d9979c821c0afd73eea815e5f5e394aaa4bd8f099e1abd65d96b3ceadd320022bb593bbc94baeeae3bf3a0a06ddf0c167b5664ffede859f
  07c8f2f45c13dc2926aaba933534332f6074ba54553ec6489fb2f5b7ff1efe80d1d5ec5bbc29188617dcf62c7edf4db05855257227ba85c6e0c382fd413d26a2
  0604847306d3ea65432dbe7567892d75188d9fbb046a2b30d315b00883af00d04f9893a2d3d886b1e58401617d1574553e4819cff7398e48ee3cb80ef443f273
  6644f14cdbcaa971d774a64fbcde74b49e5aba2078638595f46199626e4fccf564dffafc314fa19293e0dff2992da7217938300a76b673d557315b645e718d0d
)
validpgpkeys=(5A863D019DDAAC0741E6C5BAB0E8E0F09308B4E3) # David Christopher King (amigadave) <amigadave@amigadave.com>

prepare() {
  cd $pkgname

  # Revert upstream commit which causes OGG file corruption
  # https://gitlab.gnome.org/GNOME/easytag/-/issues/8
  git revert -n e5c640ca3f259f1b74e716723345521987a7bd68

  # https://bugzilla.gnome.org/show_bug.cgi?id=776150
  git cherry-pick -n cce86cfc026b1c6eaca5edd4df71a8b3a2e317c1

  # https://bugzilla.gnome.org/show_bug.cgi?id=777150
  git cherry-pick -n 4c3ff46dbe87cce3ab34b1c7520fc97291c557bd

  # https://bugzilla.gnome.org/show_bug.cgi?id=782302
  git cherry-pick -n d0c05132e6e32f907044fbe5ebd4fe90888b5010

  # https://bugzilla.gnome.org/show_bug.cgi?id=795018
  git cherry-pick -n b00ed316550df3ae94522455f56e306e659511e5

  # https://bugzilla.gnome.org/show_bug.cgi?id=795974
  git cherry-pick -n 8354e8aca16efd2ed32efb8b74693a033810f617

  # https://gitlab.gnome.org/GNOME/easytag/-/issues/29
  git cherry-pick -n 3b52bee75ac57574db0d661d4e7566884070e9cb

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/5
  git cherry-pick -n 51dd4feb869f88e23540e47ac7dfd1c8a61cce18

  # https://gitlab.gnome.org/GNOME/easytag/issues/40
  git cherry-pick -n 9dadc375fa27433ffd103fdb62b1834fc2e53449

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/17
  git cherry-pick -n cedfd104bd05c9370e0e65ed599487ba21848657

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/7
  git apply -3 ../easytag-dark-theme.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/16
  git apply -3 ../easytag-taglib-2.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/18
  git apply -3 ../easytag-scrolled-window.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/20
  git apply -3 ../easytag-playlist-dialog.patch

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-compile-warnings \
    --disable-appdata-validate
  make
}

check() {
  cd $pkgname
  make -k check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
