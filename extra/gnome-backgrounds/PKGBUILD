# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-backgrounds
pkgver=47.0
pkgrel=1
pkgdesc="Background images and data for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-backgrounds"
arch=(any)
license=(CC-BY-SA-3.0)
depends=(libjxl)
makedepends=(
  glib2
  git
  meson
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-backgrounds.git#tag=${pkgver/[a-z]/.&}")
b2sums=('f2159b54198946cee1fec4a5c75fb2518323f7674c919a7e4731ad71eabe33b9dcbf3cbe6e2a640c88845fea5427adff28af8d8faa9383ab3efa16d3370e823c')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
