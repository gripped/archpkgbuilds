# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgbase=vkd3d
pkgname=(
  vkd3d
  vkd3d-docs
)
pkgver=1.18
pkgrel=1
pkgdesc="Direct3D 12 to Vulkan translation library By WineHQ"
url="https://wiki.winehq.org/Vkd3d"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glibc
  ncurses
  spirv-tools
)
makedepends=(
  doxygen
  git
  graphviz
  mesa
  perl
  perl-json
  spirv-headers
  vulkan-headers
  vulkan-icd-loader
  wine
  xcb-util-keysyms
  xorgproto
)
source=(
  "git+https://gitlab.winehq.org/wine/vkd3d.git?signed#tag=vkd3d-$pkgver"
)
b2sums=('ae114a0d5e990c6f7d77117d46c058f4e96585a0862185f11aaf940a9d5e1540855bb5854d70f36353b8d07ad19ce5bb7fd23d20b4733eecc5785b910c18af25')
validpgpkeys=(
  277EB71D1BEBFC86E0E14983C380B588AA8A1D1C # Henri Verbeet <hverbeet@locutus.nl>
)

prepare() {
  cd vkd3d
  ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-doxygen-pdf
    --enable-doxygen-doc
    --enable-doxygen-dot
    --enable-doxygen-html
    --enable-tests
    --with-spirv-tools
  )

  cd vkd3d
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd vkd3d
  make check
}

package_vkd3d() {
  provides=(libvkd3d{,-shader,-utils}.so)

  cd vkd3d
  make DESTDIR="$pkgdir" install
}

package_vkd3d-docs() {
  pkgdesc+=" - API documentation"
  depends=()

  cd vkd3d
  mkdir -p "$pkgdir/usr/share/doc"
  cp -aT doc/html "$pkgdir/usr/share/doc/$pkgbase"
}

# vim:set sw=2 sts=-1 et:
