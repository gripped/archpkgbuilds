# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-netbook
pkgver=1.27.0
pkgrel=5
pkgdesc="A simple window management tool"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-netbook'
license=(GPL-3.0-only)
depends=(
  at-spi2-core
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libfakekey
  libwnck3
  libx11
  mate-panel
  pango
)
makedepends=(
  git
  mate-common
)
groups=(mate-extra)
source=(
  "git+https://github.com/mate-desktop/mate-netbook.git#tag=v$pkgver"
  mate-netbook-fix-undecorating.patch
)
b2sums=(
  3c7cc791797f8ba10cce4d84e26f72af7b02d089c28a626616cd5d78e110677822930505234d93b1ee9e0ab87a8b46bd70d8d5a4260d8129d73b23e4cf314bb4
  565b422aeaa811a0832e65cb2c5aeacc541b4cc867f8b6f94c22cfe0fade4106c5f68ccf98ab4fccc249c005f4cb399c8dd207b9089cbdf12c7fde7cf431f9da
)

prepare() {
  cd $pkgname

  # Fix undecorate on maximise
  # https://github.com/mate-desktop/mate-netbook/pull/67
  git cherry-pick -n 868f5a402a8c494c7dcc2dd1b8ef1e662818265d

  # Fix handling of client-side decorated windows
  # https://github.com/mate-desktop/mate-netbook/pull/76
  git cherry-pick -n 9c3eb2866e4a4d6f59264db0a7248233935b661a

  # Fix window activation with stale event timestamps
  # https://github.com/mate-desktop/mate-netbook/pull/78
  git cherry-pick -n b81247cd615f8c18abcf4b7a0dac9dc06d3b2b16

  # Fix undecorating maximized windows
  # https://github.com/mate-desktop/mate-netbook/pull/77
  git apply -3 ../mate-netbook-fix-undecorating.patch

  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --libexec="/usr/lib/$pkgname" \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
