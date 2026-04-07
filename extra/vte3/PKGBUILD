# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3
pkgname=(
  vte-common
  vte3
  vte3-utils
  vte4
  vte4-utils
  vte-docs
)
pkgver=0.84.0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://gitlab.gnome.org/GNOME/vte"
arch=(x86_64)
license=(
  # Library
  LGPL-3.0-or-later

  # Demo app, some supporting files
  GPL-3.0-or-later
)
depends=(
  cairo
  fribidi
  glib2
  glibc
  gnutls
  icu
  libgcc
  libstdc++
  lz4
  pango
  pcre2
  systemd
  systemd-libs
)
makedepends=(
  at-spi2-core
  fast_float
  fmt
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  gperf
  graphene
  gtk3
  gtk4
  meson
  vala
)
options=(!lto)
source=(
  "git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver"
  "git+https://github.com/simdutf/simdutf.git#tag=v7.7.1"
)
b2sums=('bc3016dc04a8500cc77e4dd8414d03c67d323bca8bff8f89dcae1df65c37778f2ee49c6cf143e1e6c3dcc75facb5631d5030af88267e88cf78692f0ae0021f48'
        '3e1d163c87bbe1c0f0eecc1ee4851e47d6dbdd3e471ce943bf68a7e5ee9680ad74c2a2527d3fc35c7d392b5e077070b504070eb9f6c212abe5d11885c6e1a84e')

prepare() {
  cd vte
}

build() {
  local meson_options=(
    -D docs=true
  )

  # Inject simdutf
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson vte build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_vte-common() {
  pkgdesc+=" (common files)"
  depends=(glibc)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick vte3 usr/include/vte-2.91
  _pick vte3 usr/lib/libvte-2.91.so*
  _pick vte3 usr/lib/pkgconfig/vte-2.91.pc
  _pick vte3 usr/lib/girepository-1.0/Vte-2.91.typelib
  _pick vte3 usr/share/gir-1.0/Vte-2.91.gir
  _pick vte3 usr/share/glade
  _pick vte3 usr/share/vala/vapi/vte-2.91.{deps,vapi}

  _pick vte3-utils usr/bin/vte-2.91
  _pick vte3-utils usr/share/applications/org.gnome.Vte.App.Gtk3.desktop
  _pick vte3-utils usr/share/xdg-terminals/org.gnome.Vte.App.Gtk3.desktop

  _pick vte4 usr/include/vte-2.91-gtk4
  _pick vte4 usr/lib/libvte-2.91-gtk4.so*
  _pick vte4 usr/lib/pkgconfig/vte-2.91-gtk4.pc
  _pick vte4 usr/lib/girepository-1.0/Vte-3.91.typelib
  _pick vte4 usr/share/gir-1.0/Vte-3.91.gir
  _pick vte4 usr/share/vala/vapi/vte-2.91-gtk4.{deps,vapi}

  _pick vte4-utils usr/bin/vte-2.91-gtk4
  _pick vte4-utils usr/share/applications/org.gnome.Vte.App.Gtk4.desktop
  _pick vte4-utils usr/share/xdg-terminals/org.gnome.Vte.App.Gtk4.desktop

  _pick docs usr/share/doc
}


package_vte3() {
  pkgdesc+=" (GTK3)"
  license=(LGPL-3.0-or-later)
  depends+=(
    at-spi2-core
    gtk3
    vte-common
  )
  provides+=(libvte-2.91.so)

  mv vte3/* "$pkgdir"
}

package_vte3-utils() {
  pkgdesc="VTE3 test utilities"
  license=(GPL-3.0-or-later)
  depends=(
    cairo
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    libgcc
    libstdc++
    pango
    vte3
  )

  mv vte3-utils/* "$pkgdir"
}

package_vte4() {
  pkgdesc+=" (GTK4)"
  license=(LGPL-3.0-or-later)
  depends+=(
    graphene
    gtk4
    vte-common
  )
  provides+=(libvte-2.91-gtk4.so)

  mv vte4/* "$pkgdir"
}

package_vte4-utils() {
  pkgdesc="VTE4 test utilities"
  license=(GPL-3.0-or-later)
  depends=(
    cairo
    gdk-pixbuf2
    glib2
    glibc
    gtk4
    libgcc
    libstdc++
    pango
    vte4
  )

  mv vte4-utils/* "$pkgdir"
}

package_vte-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
