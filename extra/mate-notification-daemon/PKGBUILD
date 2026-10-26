# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-notification-daemon
pkgver=1.29.0
pkgrel=4
pkgdesc="Notification daemon for MATE"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-notification-daemon'
license=(GPL-2.0-or-later)
groups=(mate)
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
  libcanberra
  libnotify
  libwnck3
  libx11
  libxml2
)
makedepends=(
  git
  glib2-devel
  mate-common
  mate-panel
)
optdepends=('mate-panel: Panel applet')
source=(
  "git+https://github.com/mate-desktop/mate-notification-daemon.git#tag=v$pkgver"
  mate-notification-daemon-fix-in-process.patch
)
b2sums=(
  362719e89592ca256aeacd8a7a84597c98b85710a0cb6fd0f47282725dff3ae64796b215237f7074c61d0a68db1f2378248d12175c2aff8d742bf4b22d05c925
  764302674a53167e33919f0b089d337203738601aab6d6c597a369e74e0b7224a702292ccb50b8286f60f03ba049f3d90e38d222d77f9e625f4e5490aa9d9203
)

prepare() {
  cd $pkgname

  # Position notification history popup
  # https://github.com/mate-desktop/mate-notification-daemon/pull/242
  git cherry-pick -n 8c4c0c8d4843222fc890233036737ac86fea1ca2 \
                     663808b562af05946fa4b3b92801ab0a8c56f0bf \
                     c5b1a9f9da605896cf102b508c436189ce2c0dd8

  # Fixes for the panel applet in in-process mode
  # https://github.com/mate-desktop/mate-notification-daemon/pull/263
  git apply -3 ../mate-notification-daemon-fix-in-process.patch

  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --libexecdir="/usr/lib/$pkgname" \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-in-process
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
