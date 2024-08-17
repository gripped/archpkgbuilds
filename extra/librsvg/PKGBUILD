# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=librsvg
pkgname=(
  librsvg
  librsvg-docs
)
pkgver=2.58.3
pkgrel=1
epoch=2
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
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
source=(
  # librsvg tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/librsvg.git#tag=$pkgver"
)
b2sums=('26bc678cb8055995579a0f6091584eb3ddc73cdf2a659ffb659b3ff5c65209bdef81a65c8e4b08a657b972cf8e27b474a33cbfa5e2adf124d795ca0b0a97850f')

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
