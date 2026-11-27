# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=caja
pkgver=1.28.1
pkgrel=1
pkgdesc="File manager for the MATE desktop"
arch=(x86_64)
url='https://github.com/mate-desktop/caja'
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=(
  at-spi2-core
  cairo
  dconf
  exempi
  gdk-pixbuf2
  glib2
  glibc
  gtk-layer-shell
  gtk3
  gvfs
  hicolor-icon-theme
  libexif
  libgcc
  libice
  libnotify
  libsm
  libx11
  libxml2
  mate-desktop
  pango
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  mate-common
)
optdepends=('gstreamer: automatic media playback when mouseover')
groups=(mate)
source=(
  "git+https://github.com/mate-desktop/caja.git#tag=v$pkgver"
  git+https://github.com/mate-desktop/mate-submodules.git
)
b2sums=(
  c3a68ef20d4aa46f25c6a59e4456ca010ad6cfb5037a5fa09e56e565230af2af5f9ea898d8078faa2b6fed0a2be17cc47cdaf891f6ce8e8eb04f1e93eb012819
  SKIP
)

prepare() {
  cd $pkgname

  git submodule init
  git config submodule.mate-submodules.url "$srcdir/mate-submodules"
  git -c protocol.file.allow=always submodule update

  # Ensure windows can be moved if compositor is using CSD
  # https://github.com/mate-desktop/caja/pull/1787
  git cherry-pick -n d55e854dade057bb954778d12acdbdc77d8c0422

  # Ensure desktop window is never decorated
  # https://github.com/mate-desktop/caja/pull/1816
  git cherry-pick -n 2445887b3947eb99bd4d430b4f1dff9ed2467d73

  # Fix desktop window position with client-side decorations
  # https://github.com/mate-desktop/caja/pull/1912
  git cherry-pick -n f9d032e7da27c9f23ae57e626ed9cb2a9965146f

  # Use standard icon name
  # https://github.com/mate-desktop/caja/pull/1914
  git cherry-pick -n 4de76eb28dd3a4198dbca9199b37c596684bddcf

  # Remove OnlyShowIn from caja-browser.desktop
  # https://github.com/mate-desktop/caja/pull/1913
  sed -i '/^OnlyShowIn=/d' data/caja-browser.desktop.in.in

  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --disable-update-mimedb \
    --disable-self-check # self-check only checks for eel in make check, requires Xorg server
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
