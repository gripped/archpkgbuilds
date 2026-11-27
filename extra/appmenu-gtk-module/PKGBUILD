# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: rilian-la-te <ria.freelander@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=appmenu-gtk-module
pkgver=26.11.1
pkgrel=1
pkgdesc="Application Menu GTK Module"
depends=(
  at-spi2-core
  bash
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk3 
  libgcc
  wayland
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
  vala
  wayland-protocols
)
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu/"
arch=(x86_64)
license=(LGPL-3.0-only)
source=(git+https://gitlab.com/vala-panel-project/vala-panel-appmenu#tag=$pkgver
        80-appmenu-gtk-module.sh)
sha256sums=('bc9ec628dc738cfc3a4be714aa0bcd4cc992d757f5064e006335cb295703eadc'
            '37a4e3c124368a30d4ef5ad65e0066af65be7f535bb15b2001ee83d08fdc992e')

build() {
  meson build-translator vala-panel-appmenu/subprojects/appmenu-glib-translator \
    --prefix=/usr
  meson compile -C build-translator

  PKG_CONFIG_PATH="$srcdir"/build-translator/meson-private/ \
  CFLAGS+=" -I\"$srcdir\"/vala-panel-appmenu/subprojects/appmenu-glib-translator/exporter/" \
  LDFLAGS+=" -L\"$srcdir\"/build-translator" \
  meson build vala-panel-appmenu/subprojects/$pkgname \
    --prefix=/usr \
    -D gtk=3
  meson compile -C build
}

package() {
  meson install --destdir="$pkgdir" -C build-translator
  meson install --destdir="$pkgdir" -C build
  install -Dm755 80-appmenu-gtk-module.sh -t "$pkgdir"/usr/lib/systemd/user-environment-generators/
}
