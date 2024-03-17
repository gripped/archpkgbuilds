# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=librsvg
pkgname=(
  librsvg
  librsvg-docs
)
pkgver=2.57.3
pkgrel=1
epoch=2
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  freetype2
  gdk-pixbuf2
  glib2
  harfbuzz
  libxml2
  pango
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  python-docutils
  rust
  vala
)
checkdepends=(ttf-dejavu)
_commit=b6fac21431c932e856d6493502643d20b42e4ad1  # tags/2.57.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/librsvg.git#commit=$_commit"
)
b2sums=('170423dff1e4c0968e23ffc25332b05b1078bc316ff4939f07a07f5e25b509564b8f2a0b0950aa8d9970e36b702fea346168c72d7ccd8e2c5d58b9dfc3ba4127')

pkgver() {
  cd librsvg
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

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
    --prefix=/usr
    --disable-static
    --enable-gtk-doc
    --enable-vala
  )

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

package_librsvg() {
  provides=(librsvg-${pkgver%%.*}.so)

  make -C librsvg DESTDIR="$pkgdir" install

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_librsvg-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
