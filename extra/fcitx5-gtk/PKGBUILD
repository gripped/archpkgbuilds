# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-gtk
pkgver=5.1.5
pkgrel=1
pkgdesc="Fcitx5 gtk im module and glib based dbus client library"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-gtk"
license=('GPL')
groups=('fcitx5-im')
depends=('glib2')
makedepends=('git' 'extra-cmake-modules' 'glib2-devel' 'gobject-introspection' 'gtk3' 'gtk4' 'ninja' 'vulkan-headers')
source=("git+https://github.com/fcitx/fcitx5-gtk.git#tag=$pkgver?signed")
sha512sums=('213e22da42a46a3ab4d6423c94fc8f03a5051ded22e0bede7332e6f4ebe2c325fc36d06aef09028031f1e25a9c170326b4fb3a9bd12527dcfa8ef966f477fecb')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build(){
  cd $pkgname
  cmake -GNinja . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_GTK2_IM_MODULE=OFF
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
