# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-librsvg
pkgname=(
  lib32-librsvg
)
pkgver=2.58.1
pkgrel=1
epoch=2
pkgdesc="SVG rendering library (32-bit)"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  lib32-cairo
  lib32-freetype2
  lib32-gcc-libs
  lib32-gdk-pixbuf2
  lib32-glib2
  lib32-glibc
  lib32-harfbuzz
  lib32-libxml2
  lib32-pango
  librsvg
)
makedepends=(
  git
  gobject-introspection
  lib32-rust-libs
  rust
)
checkdepends=(ttf-dejavu)
source=("git+https://gitlab.gnome.org/GNOME/librsvg.git?signed#tag=$pkgver")
b2sums=('146472a97dc2bf7b4b0150b2984b45e91ea5e188d162a37c3e3123f750e788c7b618f44e37ca1e96c6e2de354633e4918ba52531b725dc02e5d3325727c73853')
validpgpkeys=(
  263F590F7E0FE1CB3EA274B0167637EB6FB8DCCE # Federico Mena Quintero <federico@gnome.org>
)

prepare() {
  cd librsvg
  NOCONFIGURE=1 ./autogen.sh
}

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
  local configure_options=(
    --build="$CHOST"
    --host=i686-pc-linux-gnu
    --prefix=/usr
    --libdir=/usr/lib32
    --disable-introspection
    --disable-static
    --disable-gtk-doc
    --disable-vala
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  export RUST_TARGET=i686-unknown-linux-gnu

  cd librsvg
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  # Tests need nightly features
  RUSTC_BOOTSTRAP=1 make -C librsvg check || :
}

package_lib32-librsvg() {
  provides=(librsvg-${pkgver%%.*}.so)

  make -C librsvg DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include,share}
}

# vim:set sw=2 sts=-1 et:
