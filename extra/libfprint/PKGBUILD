# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint
pkgver=1.94.7
pkgrel=1
pkgdesc="Library for fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  libgudev
  libgusb
  nss
  pixman
  systemd
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
)
checkdepends=(
  cairo
  umockdev
)
provides=(libfprint-2.so)
groups=(fprint)
_commit=bebe8565cd7e2c89c0b0c5e6ee7353b80d6a51e1  # tags/v1.94.7^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
