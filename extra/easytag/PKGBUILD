# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=easytag
pkgver=2.4.3
pkgrel=19
pkgdesc='Simple application for viewing and editing tags in audio files'
arch=(x86_64)
url='https://wiki.gnome.org/Apps/EasyTAG'
license=(GPL-2.0-or-later)
depends=(
  dconf
  flac
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  id3lib
  libgcc
  libid3tag
  libogg
  libstdc++
  libvorbis
  opus
  opusfile
  speex
  taglib
  wavpack
)
makedepends=(
  git
  glib2-devel
  intltool
  yelp-tools
)
source=(
  "git+https://gitlab.gnome.org/GNOME/$pkgname.git?signed#tag=$pkgname-$pkgver"
  easytag-dark-theme.patch
  easytag-scrolled-window.patch
  easytag-playlist-dialog.patch
  easytag-no-appmenu.patch
  easytag-fix-window-size.patch
  easytag-no-appstream-glib.patch
)
b2sums=(
  bc0e51a4d2eca339b122a5f2c65625f0a3d7364a370f4d61a7b22dae8b84a3732fd382c9800eb464562edf352116f149414230ecea670146250bbeccb8c31f66
  3b7bbddc5ee496917d9979c821c0afd73eea815e5f5e394aaa4bd8f099e1abd65d96b3ceadd320022bb593bbc94baeeae3bf3a0a06ddf0c167b5664ffede859f
  09115abb801adce0fbfe23a13f1ca0bb7c52c50db17a23e523e75e3dac38d797c5b59dcb9ff3d54e18103ddd71f3e2db311996c7203768a5ebe6bd1f07968646
  6644f14cdbcaa971d774a64fbcde74b49e5aba2078638595f46199626e4fccf564dffafc314fa19293e0dff2992da7217938300a76b673d557315b645e718d0d
  d58363471fa4a159d50b2fe03c07581bb530e158c18fd086d6e3a5714cc3514f62fa3b5002525cf45e825d6e684cb1083bd874e07a65defb1848d352c258f664
  5475058b563fc52cbb03f5158367e011db0af9ec3bd965f310fbcc98d425500ff48cc2e43834937c8611fc3530efe8ca71dc07d3285a40d7ba0e07be1e07803a
  a2e2c8470683a500ed832db7a8161742a42be30ec50fff1f8bb2b9f937768c75ff7f24d641c83de91422f1942a5d156149bdda03f0883c668bf5d2da79417eb6
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

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/16
  git cherry-pick -n 9fb842809c53e0b99ed68b44d5e34f1e08baec64 \
                     3f753f8e4f7a44c78dc2a629538905109d0220a0

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/7
  git apply -3 ../easytag-dark-theme.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/18
  git apply -3 ../easytag-scrolled-window.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/20
  git apply -3 ../easytag-playlist-dialog.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/21
  git apply -3 ../easytag-no-appmenu.patch

  # https://gitlab.gnome.org/GNOME/easytag/-/merge_requests/27
  git apply -3 ../easytag-fix-window-size.patch

  # Remove dependency on appstream-glib
  git apply -3 ../easytag-no-appstream-glib.patch

  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-compile-warnings \
    CFLAGS="$CFLAGS -std=gnu11"
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
